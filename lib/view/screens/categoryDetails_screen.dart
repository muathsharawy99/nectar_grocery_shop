import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectaar/model/product_model.dart';
import 'package:nectaar/view/components/product_card.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_cubit.dart';
import 'package:nectaar/view_model/bloc/home_cubit/home_state.dart';

class CategoryDetails extends StatelessWidget {
  final int id;
  final String name;

  const CategoryDetails({required this.id, required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: HomeCubit()
        ..getCategoriesProductsByID(id),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(name, style: const TextStyle(color: Colors.black),),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.file_upload_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            // extendBodyBehindAppBar: true,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 10.h,
                    ),
                    GridView.count(
                      childAspectRatio: 3 / 3,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                          cubit.currentCategoryProducts?.product?.length ?? 0,
                              (index) => ProductCard(product:cubit.currentCategoryProducts?.product?[index] ?? Product())
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
