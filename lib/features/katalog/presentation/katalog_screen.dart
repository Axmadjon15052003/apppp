import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:singelton_dars/assets/colors/color.dart';
import 'package:singelton_dars/assets/widgets/icons.dart';
import 'package:singelton_dars/assets/widgets/images.dart';
import 'package:singelton_dars/features/katalog/presentation/bloc/bloc/katalog_bloc.dart';

import 'package:singelton_dars/features/katalog/presentation/widgets/appBar.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        body: BlocBuilder<KatalogBloc, KatalogState>(
          builder: (context, state) {
            if (state.status == Status.pure) {
              context.read<KatalogBloc>().add(
                    KatalogBlocStarted(),
                  );
              context.read<KatalogBloc>().add(GetKatalog(),);
              print("Keldiiii");
              return const SizedBox();
            } else if (state.status == Status.loading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.status == Status.succsess) {
              print("Datas =========== ${state.tovar2}");
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomScrollView(
                  // physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  slivers: [

                    SliverGrid.builder(
                      itemCount: state.tovar2.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return Container( 
                          decoration: BoxDecoration( 
                            borderRadius: BorderRadius.circular(16), 
                            color: white, 

                          ),
                          child: Stack( 
                            children: [ 
                              Padding(
                                padding: const EdgeInsets.only(top: 12, left: 12),
                                child: Text(state.tovar2[index].title,style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600,color: textBlack),),
                              ),
                              Align(child: Image.asset(state.tovar2[index].img),alignment: Alignment.bottomRight,),
                            ],
                          ),
                        );
                      },
                    ),

                    //AXMADJONSHU JOYGA YOZASIZ SLIVERGRID.BUILDER PASDA OBRAZES TURIPTI

                    SliverToBoxAdapter(
                      child: Text(
                        'Ushbu takliflarga e’tibor qarating',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    const SliverGap(20),
                    SliverGrid.builder(
                      itemCount: state.tovar.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.52,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: white,
                            border: Border.all(
                              color: textFieldNoFocusBackgound,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                child: Stack(
                                  children: [
                                    Image.asset(state.tovar[index].img),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  100) *
                                              13.4,
                                          height: (MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100) *
                                              3.46,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              // topRight: Radius.circular(12),
                                            ),
                                            color: yellow,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${state.tovar[index].rate}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      fontSize: 12,
                                                      color: white,
                                                    ),
                                              ),
                                              const Gap(4),
                                              SvgPicture.asset(
                                                AppIcons.yulduzcha,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(8),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       top: 8, bottom: 7, left: 8, right: 8),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [

                              //     ],
                              //   ),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 7),
                                child: Text(
                                  state.tovar[index].title,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                              const Gap(4),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 7),
                                child: Text(
                                  state.tovar[index].description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: grey,
                                      ),
                                ),
                              ),
                              const Gap(4),
                              if (state.tovar[index].oldPrice != null) ...{
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 7),
                                  child: Text(
                                    '${state.tovar[index].oldPrice!} UZS',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: pinputErrorBorder,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ),
                              },
                              const Gap(2),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 7),
                                child: Text(
                                  '${state.tovar[index].nowPrice} UZS',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16,
                                      ),
                                ),
                              ),
                              if (state.tovar[index].oldPrice != null) ...{
                                const Spacer(),
                              } else ...{
                                const Spacer(),
                              },
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 7, bottom: 16),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 7),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100 *
                                              4,
                                      width: MediaQuery.of(context).size.width /
                                          100 *
                                          28,
                                      decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(AppIcons.savatcha),
                                          Text(
                                            "Savatchaga",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                                  color: textBlack,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: SvgPicture.asset(AppIcons.like),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class WContainer extends StatelessWidget {
  const WContainer({
    super.key,
    required this.text,
    required this.imagePath,
  });
  final String text;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(right: 20,left: 20),
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.height * 0.13,

      // SvgPicture.asset("assets/svg/koy.svg"),

      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: const Color(0xF7F7F7F7),
          borderRadius: BorderRadius.circular(16)),

      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF383838),
                fontWeight: FontWeight.w600),
          ),
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.18,
            height: MediaQuery.of(context).size.height * 0.085,
          ),
        ],
      ),
    );
  }
}

// class ContaiNer extends StatelessWidget {
//   const ContaiNer({
//     super.key,
//     required this.text,
//     required this.imagePath,
//   });
//   final String text;
//   final String imagePath;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: EdgeInsets.only(right: 20,left: 20),
//       width: MediaQuery.of(context).size.width * 0.28,
//       height: MediaQuery.of(context).size.height * 0.13,

//       // SvgPicture.asset("assets/svg/koy.svg"),

//       clipBehavior: Clip.hardEdge,
//       decoration: BoxDecoration(
//           color: const Color(0xF7F7F7F7),
//           borderRadius: BorderRadius.circular(16)),

//       child: Column(
//         children: [
//           Text(
//             text,
//             style: const TextStyle(
//                 fontSize: 12,
//                 color: Color(0xFF383838),
//                 fontWeight: FontWeight.w600),
//           ),
//           Image.asset(
//             imagePath,
//             fit: BoxFit.cover,
//             width: MediaQuery.of(context).size.width * 0.18,
//             height: MediaQuery.of(context).size.height * 0.085,
//           ),
//         ],
//       ),
//     );
//   }
// }

//                 Text(
//                   'Ushbu takliflarga e’tibor qarating',
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w500,
//                       ),
//                 ),
//                 const Gap(20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       clipBehavior: Clip.hardEdge,
//                       height: MediaQuery.of(context).size.height * 0.378,
//                       width: MediaQuery.of(context).size.width * 0.438,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           width: 2,
//                           color: textFieldNoFocusBackgound,
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Stack(
//                             children: [
//                               Image.asset(
//                                 AppImages.rotbam,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Container(
//                                     height: MediaQuery.of(context).size.height /
//                                         100 *
//                                         3.5,
//                                     width: MediaQuery.of(context).size.width /
//                                         100 *
//                                         13.4,
//                                     decoration: const BoxDecoration(
//                                       color: yellow,
//                                       borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(12),
//                                       ),
//                                     ),
//                                     alignment: Alignment.center,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           "5",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodySmall!
//                                               .copyWith(
//                                                 fontSize: 12,
//                                                 color: white,
//                                               ),
//                                         ),
//                                         const Gap(4),
//                                         SvgPicture.asset(
//                                           AppIcons.yulduzcha,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Container(
//                             width:
//                                 MediaQuery.of(context).size.width / 100 * 41.6,
//                             height:
//                                 MediaQuery.of(context).size.height / 100 * 18.1,
//                             padding: const EdgeInsets.only(
//                               top: 8,
//                               right: 7,
//                               bottom: 7,
//                               left: 8,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(9),
//                               color: catalog,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "KNAUF",
//                                   style: Theme.of(context).textTheme.labelLarge,
//                                 ),
//                                 const Gap(4),
//                                 Text(
//                                   "Shtukaturka ROTBAND KNAUF",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelLarge!
//                                       .copyWith(
//                                         color: grey,
//                                       ),
//                                 ),
//                                 const Gap(4),
//                                 Text(
//                                   "184 000 UZS",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelLarge!
//                                       .copyWith(
//                                         color: pinputErrorBorder,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                 ),
//                                 const Gap(2),
//                                 Text(
//                                   "84 000 UZS",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyMedium!
//                                       .copyWith(
//                                         fontSize: 16,
//                                       ),
//                                 ),
//                                 const Gap(4),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.all(8),
//                                       height:
//                                           MediaQuery.of(context).size.height /
//                                               100 *
//                                               4,
//                                       width: MediaQuery.of(context).size.width /
//                                           100 *
//                                           28,
//                                       decoration: BoxDecoration(
//                                         color: yellow,
//                                         borderRadius: BorderRadius.circular(6),
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           SvgPicture.asset(AppIcons.savatcha),
//                                           Text(
//                                             "Savatchaga",
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .labelLarge!
//                                                 .copyWith(
//                                                   color: textBlack,
//                                                 ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const Gap(10),
//                                     SvgPicture.asset(AppIcons.like),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     //______________________________________________________2________
//                     Container(
//                       clipBehavior: Clip.hardEdge,
//                       height: MediaQuery.of(context).size.height * 0.378,
//                       width: MediaQuery.of(context).size.width * 0.438,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           width: 2,
//                           color: textFieldNoFocusBackgound,
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Stack(
//                             children: [
//                               Image.asset(
//                                 AppImages.oboi,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Container(
//                                     height: MediaQuery.of(context).size.height /
//                                         100 *
//                                         3.5,
//                                     width: MediaQuery.of(context).size.width /
//                                         100 *
//                                         13.4,
//                                     decoration: const BoxDecoration(
//                                       color: yellow,
//                                       borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(12),
//                                       ),
//                                     ),
//                                     alignment: Alignment.center,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           "5",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodySmall!
//                                               .copyWith(
//                                                 fontSize: 12,
//                                                 color: white,
//                                               ),
//                                         ),
//                                         const Gap(4),
//                                         SvgPicture.asset(
//                                           AppIcons.yulduzcha,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Container(
//                             width:
//                                 MediaQuery.of(context).size.width / 100 * 41.6,
//                             height:
//                                 MediaQuery.of(context).size.height / 100 * 18.1,
//                             padding: const EdgeInsets.only(
//                               top: 8,
//                               right: 7,
//                               bottom: 7,
//                               left: 8,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(9),
//                               color: catalog,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Quelyd",
//                                   style: Theme.of(context).textTheme.labelLarge,
//                                 ),
//                                 const Gap(4),
//                                 Text(
//                                   "“Quelyd” Gul qog‘ozlar uchun yelim",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelLarge!
//                                       .copyWith(
//                                         color: grey,
//                                       ),
//                                 ),
//                                 const Gap(4),
//                                 Text(
//                                   "84 000 UZS",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyMedium!
//                                       .copyWith(
//                                         fontSize: 16,
//                                       ),
//                                 ),
//                                 const Spacer(),
//                                 const Gap(4),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.all(8),
//                                       height:
//                                           MediaQuery.of(context).size.height /
//                                               100 *
//                                               4,
//                                       width: MediaQuery.of(context).size.width /
//                                           100 *
//                                           28,
//                                       decoration: BoxDecoration(
//                                         color: yellow,
//                                         borderRadius: BorderRadius.circular(6),
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           SvgPicture.asset(AppIcons.savatcha),
//                                           Text(
//                                             "Savatchaga",
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .labelLarge!
//                                                 .copyWith(
//                                                   color: textBlack,
//                                                 ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const Gap(10),
//                                     SvgPicture.asset(AppIcons.like),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Gap(20),
//                 Container(
//                   alignment: Alignment.center,
//                   height: MediaQuery.of(context).size.height / 100 * 5.7,
//                   decoration: BoxDecoration(
//                     color: pinkish,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Barchasini ko‘rish",
//                         style:
//                             Theme.of(context).textTheme.headlineSmall!.copyWith(
//                                   color: yellow,
//                                 ),
//                       ),
//                       const Gap(8),
//                       SvgPicture.asset(AppIcons.arrow),
//                     ],
//                   ),
//                 ),
//                 const Gap(20)
//               ],
//             ),
//           ),
//         ),
