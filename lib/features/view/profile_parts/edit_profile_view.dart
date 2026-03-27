import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saypay/core/component/text_actions.dart';
import 'package:saypay/core/utils/size_extension/size_ext.dart';

import '../../../core/const/app_constant.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/component/app_error_widget.dart';
import '../../../core/utils/ui_utils/ui_utils.dart';
import '../../../repositories/auth_repository.dart';
import '../../../services/session_controller/session_controller.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final AuthRepository _authRepository = AuthRepository();
  final ImagePicker _picker = ImagePicker();
  final Key _avatarKey = UniqueKey();
  bool _isUploading = false;
  File? _selectedFile;

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (image == null) return;

      setState(() {
        _selectedFile = File(image.path);
      });
    } catch (e) {
      if (mounted)
        AppErrorWidget.show(message: "Could not select image. Error: $e");
    }
  }

  Future<void> _saveAndContinue() async {
    
    if (_selectedFile == null) {
      if (SessionController.userModel != null) {
        await SessionController().saveUser(SessionController.userModel!);
      }
      if (mounted) Get.back();
      return;
      
    }

    setState(() => _isUploading = true);

    try {
      final user = SessionController.userModel;
      if (user == null) throw AuthException('No user session found');

      final publicUrl = await _authRepository.uploadProfileImage(
        _selectedFile!,
        user.id,
      );

      final updatedUser = user.copyWith(avatarUrl: publicUrl);
      await SessionController().saveUser(updatedUser);

      if (mounted) {
        // ✅ Update UI with new image
        setState(() {
          _isUploading = false;
          // keep _selectedFile so local image shows immediately
        });

        // ✅ Show flushbar
        UiUtils.showFlushbar(
          context,
          "Profile photo updated successfully!",
          isError: false,
        );

        // ✅ Wait for flushbar to be visible then go back
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) Get.back();
      }
    } on AuthException catch (e) {
      if (mounted) {
        setState(() => _isUploading = false);
        AppErrorWidget.show(message: e.message);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isUploading = false);
        AppErrorWidget.show(message: "Could not upload image. Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theme.colorScheme.onPrimary,
        surfaceTintColor: theme.colorScheme.onPrimary,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new, size: 20.sp),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26.sp),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Text(
                "Add a Profile Photo",
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              0.01.vSpace,
              Text(
                "Add an image to customize your account\nand discover a more enhanced experience",
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              0.04.vSpace,
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 173.sp,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: _selectedFile != null
                          ? FileImage(_selectedFile!) as ImageProvider
                          : (SessionController.userModel?.avatarUrl != null &&
                                SessionController
                                    .userModel!
                                    .avatarUrl!
                                    .isNotEmpty)
                          ? NetworkImage(
                              SessionController.userModel!.avatarUrl!,
                            )
                          : const AssetImage(AppConstant.profile)
                                as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 65,

                      child: GestureDetector(
                        onTap: _isUploading ? null : _pickImage,
                        child: CircleAvatar(
                          radius: 20.sp,
                          backgroundColor: Colors.black,
                          child: _isUploading
                              ? SizedBox(
                                  width: 20.sp,
                                  height: 20.sp,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Icon(
                                  Icons.edit,
                                  color: theme.colorScheme.onPrimary,
                                  size: 20.sp,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              0.22.vSpace,
              TextActions(
                title: _isUploading ? "Uploading..." : "Continue",
                onTap: _isUploading ? null : _saveAndContinue,
                titleColor: Colors.black,
                weight: FontWeight.w800,
                fontSize: 19,
                background: theme.scaffoldBackgroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
