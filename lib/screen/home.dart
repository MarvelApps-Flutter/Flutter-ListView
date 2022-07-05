import 'package:flutter/material.dart';
import 'package:listview_module/model/dataList/data.dart';
import 'package:listview_module/widget/common_component.dart';

import 'order_detail_screen.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonComponent.appbar('My Orders'),
        body: _body(),
      ),
    );
  }

  ListView _body() {
    return ListView.builder(
        itemCount: Data().orderlist.length,
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            onTap: (){
              Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => 
              OrderDetailScreen(orderItem: Data().orderlist[index],index: index),),
            );},
            child: _orderItemContainer(context, index),
            );
        }
      );
  }
  
  Widget _orderItemContainer(BuildContext context,int index){
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 60,
                  child: Image.network(Data().orderlist[index].imageUrl,fit: BoxFit.fill,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                padding: const EdgeInsets.only(left:20),
                width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.25,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.25-50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                        Data().orderlist[index].orderStatus,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'NotoSerif',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black
                                          ),
                                        ),
                              const SizedBox(height: 12,),
                              Text(
                                        Data().orderlist[index].orderdescription,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: 'NotoSerif',
                                          fontSize: 13,
                                          color: Color(0xFF7A7A7A)
                                          ),
                                        ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.all(7.5),
                          child: Icon(Icons.arrow_forward_ios_rounded,size: 15,),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,bottom: 5),
                      child: Row(
                        children: List.generate(5,
                                    (index1) {
                                      return CommonComponent.getRating(context,index,index1);
                                    }),
                      ),
                    ),
                    CommonComponent.reviewText(context, Data().orderlist[index].rating)
                  ],
                ),
              ),
            )
          ],
        ),
         Divider(height: 1,thickness: 0.7,color: Colors.grey.shade300,)
      ],
    );
  }

  
}