import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saypay/core/component/text_actions.dart';
import 'package:saypay/core/utils/size_extension/size_ext.dart';

import '../../../core/const/app_constant.dart';
import '../../../services/session_controller/session_controller.dart';
import '../../../services/profile_services/profile_services.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final ProfileServices _profileServices = Get.put(ProfileServices());

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_ios_new, size: 20.sp),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add a Profile Photo",
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),
              0.01.vSpace,
              Text(
                "Add an image to customize your account\nand discover a more enhanced experience",
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              0.04.vSpace,
              Center(
                child: Stack(
                  children: [
                    Obx(() => CircleAvatar(
                          radius: 165.sp,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: _profileServices.selectedFile.value != null
                              ? FileImage(_profileServices.selectedFile.value!) as ImageProvider
                              : (SessionController.userModel?.avatarUrl != null &&
                                      SessionController
                                          .userModel!.avatarUrl!.isNotEmpty)
                                  ? NetworkImage(
                                      SessionController.userModel!.avatarUrl!,
                                    )
                                  : const AssetImage(AppConstant.profile)
                                      as ImageProvider,
                        )),
                    Positioned(
                      bottom: 0,
                      right: 65,
                      child: Obx(() => GestureDetector(
                            onTap: _profileServices.isUploading.value ? null : _profileServices.pickImage,
                            child: CircleAvatar(
                              radius: 20.sp,
                              backgroundColor: Colors.black,
                              child: _profileServices.isUploading.value
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
                          )),
                    ),
                  ],
                ),
              ),
              0.16.vSpace,
              Obx(() => TextActions(
                    title: _profileServices.isUploading.value ? "Uploading..." : "Continue",
                    onTap: _profileServices.isUploading.value ? null : () => _profileServices.saveAndContinue(context),
                    titleColor: Colors.black,
                    weight: FontWeight.w800,
                    fontSize: 19,
                    background: theme.scaffoldBackgroundColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

