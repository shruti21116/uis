import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uis/Model/Response/cities_response_model.dart';

import 'package:uis/Model/Response/country_response_model.dart';
import 'package:uis/Model/Response/state_response_model.dart';

import 'package:uis/ViewModel/country_controller.dart';

class DropDownButtonDemo extends StatefulWidget {
  const DropDownButtonDemo({
    Key? key,
  }) : super(key: key);

  @override
  State<DropDownButtonDemo> createState() => _DropDownButtonDemoState();
}

class _DropDownButtonDemoState extends State<DropDownButtonDemo> {
  CountryController countryController = Get.put(CountryController());

  @override
  void initState() {
    countryController.getCountry();
    countryController.getStates();
    countryController.getCities();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GetBuilder<CountryController>(
          builder: (controller) {
            if (controller.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              CountryResponseModel country = controller.countryResponseModel!;

              StateResponseModel state = controller.stateResponseModel!;
              CitiesResponseModel cities = controller.citiesResponseModel!;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    isExpanded: true,
                    value: controller.selectedCountry,
                    hint: const Text("Select country"),
                    items: List.generate(
                      country.data.length,
                      (index) => DropdownMenuItem(
                        value: country.data[index].name,
                        child: Text("${country.data[index].name}"),
                      ),
                    ),
                    onChanged: (value) {
                      controller.selectedCountry = value;

                      for (var element in country.data) {
                        if (element.name == controller.selectedCountry) {
                          controller.selectedCountryId = element.id.toString();
                          print(
                              'COUNTRY ${controller.selectedCountry} id ${element.id}');

                          controller.getStates();
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButton(
                    isExpanded: true,
                    value: controller.selectedState,
                    hint: const Text("Select state"),
                    items: List.generate(
                      state.data.length,
                      (index) => DropdownMenuItem(
                        value: state.data[index].name,
                        child: Text("${state.data[index].name}"),
                      ),
                    ),
                    onChanged: (value) {
                      controller.selectedState = value;

                      for (var element in state.data) {
                        if (element.name == controller.selectedState) {
                          controller.selectedStateId = element.id.toString();
                          print(
                              'STATE ${controller.selectedStateId} id ${element.id}');
                          controller.getCities();
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButton(
                    isExpanded: true,
                    value: controller.selectedCities,
                    hint: const Text("Select city"),
                    items: List.generate(
                      cities.data.length,
                      (index) => DropdownMenuItem(
                        value: cities.data[index].name,
                        child: Text("${cities.data[index].name}"),
                      ),
                    ),
                    onChanged: (value) {
                      controller.selectedCities = value;

                      for (var element in cities.data) {
                        if (element.name == controller.selectedCities) {
                          controller.selectedCitiesId = element.id.toString();
                          print(
                              'CITY ${controller.selectedCitiesId} id ${element.id}');
                          //    controller.getCities();
                        }
                      }
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
