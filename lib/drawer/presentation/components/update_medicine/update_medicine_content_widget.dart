import 'package:elagk_pharmacy/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk_pharmacy/auth/presentation/components/main_button.dart';
import 'package:elagk_pharmacy/auth/presentation/components/screen_background.dart';
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/services/services_locator.dart';
import 'package:elagk_pharmacy/core/utils/app_assets.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/add_medicine/import_product_image.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/add_medicine/show_picker_dialog.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/add_update_space_widget.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/update_medicine/delete_medicine_dialog.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/update_medicine/product_category_button.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/categories_controller/categories_bloc.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/medicine_controller/medicine_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menu_button/menu_button.dart';

class UpdateMedicineContent extends StatelessWidget {
  const UpdateMedicineContent({
    Key? key,
  }) : super(key: key);
  static final _formKey = GlobalKey<FormState>();

  static String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: BlocBuilder<MedicineBloc, MedicineState>(
            builder: (context, state) {
              return Column(
                children: [
                  // Product forms.
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            MainTextFormField(
                              controller: state.productNameController!,
                              label: AppStrings.productName,
                              inputType: TextInputType.text,
                              obscure: false,
                              validator: (value) {
                                if (value!.length < AppSize.s3) {
                                  return AppStrings.enterValidProductName;
                                }
                                return null;
                              },
                            ),
                            const MedicineSpace(),
                            MainTextFormField(
                              controller: state.productDetailsController!,
                              inputType: TextInputType.multiline,
                              label: AppStrings.productDetails,
                              obscure: false,
                              maxLines: 3,
                              validator: (value) {
                                if (value!.length < AppSize.s3) {
                                  return AppStrings.enterValidProductDetails;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const MedicineSpace(),
                            MainTextFormField(
                              controller: state.productPriceController!,
                              label: AppStrings.productPrice,
                              inputType: TextInputType.number,
                              obscure: false,
                              validator: (value) {
                                if (value!.isEmpty || value == '0') {
                                  return AppStrings.enterValidPrice;
                                }
                                return null;
                              },
                            ),
                            const MedicineSpace(),
                            MainTextFormField(
                              controller: state.discountPercentController!,
                              label: AppStrings.productDiscountPercent,
                              inputType: TextInputType.number,
                              obscure: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStrings.enterValidDiscountPercent;
                                }
                                return null;
                              },
                            ),
                            const MedicineSpace(),
                            // Category & quantity
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: MainTextFormField(
                                    controller: state.quantityController!,
                                    label: AppStrings.theQuantity,
                                    inputType: TextInputType.phone,
                                    obscure: false,
                                    validator: (value) {
                                      if (value!.isEmpty || value == "0") {
                                        return AppStrings.enterValidQuantity;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          AppStrings.productCategoryName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ),
                                      Flexible(
                                        child: BlocBuilder<CategoriesBloc,
                                            CategoriesState>(
                                          builder: (context, state) {
                                            selectedCategory =
                                                state.selectedCategory;
                                            return MenuButton<String>(
                                              items: state.categoriesName,
                                              itemBuilder: (String value) =>
                                                  Container(
                                                height: AppSize.s50,
                                                width: double.infinity,
                                                alignment:
                                                    Alignment.centerRight,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal:
                                                            AppPadding.p16),
                                                child: Text(value),
                                              ),
                                              toggledChild:
                                                  const ProductCategoryButton(),
                                              onItemSelected: (String value) {
                                                sl<CategoriesBloc>().add(
                                                    SelectCategoryEvent(value));
                                              },
                                              child:
                                                  const ProductCategoryButton(),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Category & quantity
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: MainTextFormField(
                                    controller: state.quantityController!,
                                    label: AppStrings.theQuantity,
                                    inputType: TextInputType.phone,
                                    obscure: false,
                                    validator: (value) {
                                      if (value!.isEmpty || value == "0") {
                                        return AppStrings.enterValidQuantity;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          AppStrings.productCategoryName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ),
                                      Flexible(
                                        child: BlocBuilder<CategoriesBloc,
                                            CategoriesState>(
                                          builder: (context, state) {
                                            selectedCategory =
                                                state.selectedCategory;
                                            switch (
                                                state.categoryRequestState) {
                                              case RequestState.loading:
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: AppColors
                                                              .primary),
                                                );
                                              case RequestState.loaded:
                                                return MenuButton<String>(
                                                  items: state.categoriesName,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                          AppSize.s10),
                                                    ),
                                                  ),
                                                  topDivider: true,
                                                  itemBuilder: (String value) =>
                                                      Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal:
                                                            AppPadding.p10),
                                                    child: Text(value),
                                                  ),
                                                  toggledChild:
                                                      const ProductCategoryButton(),
                                                  onItemSelected:
                                                      (String value) {
                                                    context
                                                        .read<CategoriesBloc>()
                                                        .add(
                                                            SelectCategoryEvent(
                                                                value));
                                                  },
                                                  child:
                                                      const ProductCategoryButton(),
                                                );
                                              case RequestState.error:
                                                return const SizedBox();
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const MedicineSpace(),
                            MainTextFormField(
                              controller: state.doseController!,
                              label: AppStrings.dose,
                              inputType: TextInputType.text,
                              obscure: false,
                              validator: (value) {
                                return null;
                              },
                            ),
                            const MedicineSpace(),
                            BlocBuilder<MedicineBloc, MedicineState>(
                              builder: (context, state) {
                                return ImportProductImage(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ShowPickerDialog(
                                          onCameraTapped: () {
                                            context
                                                .read<MedicineBloc>()
                                                .pickImage(ImageSource.camera);
                                            Navigator.of(context).pop();
                                          },
                                          onGalleryTapped: () {
                                            context
                                                .read<MedicineBloc>()
                                                .pickImage(ImageSource.gallery);
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: AppSize.si5,
                        child: MainButton(
                          title: AppStrings.editingProduct,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<MedicineBloc>().add(
                                    UpdateMedicineEvent(
                                      context: context,
                                      productId: state.medicine!.productId,
                                      productName:
                                          state.productNameController!.text,
                                      productDescription:
                                          state.productDetailsController!.text,
                                      productPrice: double.parse(state.productPriceController!.text),
                                      discountPercent: double.parse(state
                                          .discountPercentController!.text),
                                      categoryName: selectedCategory,
                                      quantity: int.parse(state.quantityController!.text),
                                      dose: state.doseController!.text,
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          onPressed: () {
                            showWarningDialog(
                                context: context,
                                onDeletePressed: () {
                                  context.read<MedicineBloc>().add(
                                        DeleteMedicineEvent(
                                          context: context,
                                          id: state.medicine!.productId,
                                        ),
                                      );
                                });
                          },
                          icon: SvgPicture.asset(
                            ImageAssets.deleteIcon,
                            fit: BoxFit.contain,
                            height: AppSize.s40,
                            width: AppSize.s40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
    );
  }
}
