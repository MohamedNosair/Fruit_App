import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  final bool isEnable = false;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    final orderEntity = context.read<OrderEntity>().shippingAddressEntity;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ValueListenableBuilder<AutovalidateMode>(
        /// عشان اليسن علي حالة الفيلد
        valueListenable: valueListenable,
        builder: (BuildContext context, value, Widget? child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            spacing: 8.h,
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity!.name = value!;
                },
                hintText: S.current.name,
                textInputType: TextInputType.text,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity!.email = value!;
                },
                hintText: S.current.email,
                textInputType: TextInputType.text,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity!.address = value!;
                },
                hintText: S.current.address,
                textInputType: TextInputType.text,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity!.city = value!;
                },
                hintText: S.current.city,
                textInputType: TextInputType.text,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity!.addressDetails = value!;
                },
                hintText: S.current.apartment_number,
                textInputType: TextInputType.text,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  orderEntity!.phoneNumber = value!;
                },
                hintText: S.current.phone_number,
                textInputType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
