import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/di/dependency_injection.dart';
import 'package:fruit_app/core/repo/order/order_repo.dart';
import 'package:fruit_app/core/utils/get_user.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_app/features/checkout/presentation/logic/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/add_order_cubit_bloc_consumer.dart';
import 'package:fruit_app/features/checkout/presentation/widgets/checkout_body_view.dart';
import 'package:fruit_app/features/home/domain/entity/cart_Entity.dart';
import 'package:fruit_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  CheckoutView({super.key, required this.cartItem});
  CartEntity cartItem;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    orderEntity = OrderEntity(widget.cartItem, uID: getDataOfUser().uId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(sl.get<OrderRepo>()),
      child: Scaffold(
        appBar: AppBarCustom(
          showBackButton: true,
          showNotificationIcon: false,
          text: S.current.shipping,
        ),
        body: AddOrderCubitBlocConsumer(
          child: Provider.value(value: orderEntity, child: CheckoutBodyView()),
        ),
      ),
    );
  }
}
