

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class Statistic extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> statisticData = [
      {'icons':Icons.shopping_cart_outlined, 'color':Colors.deepPurple[100], 'work':'Shop','workDetails':'Buy new clothes', 'price': '-\$90'},
      {'icons':Icons.send_to_mobile,'color':Colors.green[100], 'work':'Electr..','workDetails':'Buy new Iphone', 'price': '-\$1290'},
      {'icons':Icons.car_rental_outlined, 'color':Colors.yellow[100],'work':'Electr..','workDetails':'Buy new car', 'price': '-\$13980'},
      {'icons':Icons.car_rental_outlined, 'color':Colors.yellow[100],'work':'Electr..','workDetails':'Buy new car', 'price': '-\$13980'},
    ];
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50 ,left: 10,right: 10,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Statistic',style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900,fontFamily: 'H1fonts'),),
                InkWell(
                  onTap: (){
                    // do your operation
                    print('this is click able button');
                  },
                  child: Container(
                    width: 155,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffebf0fc),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('This month',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600,fontFamily: 'H1fonts'),),
                        Icon(Icons.arrow_drop_down_outlined,size: 30,),
                    ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal:15),
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Color(0xff5f71f1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total expense',style: TextStyle(fontSize: 22,fontFamily: 'subfonts',color: Colors.white),),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xff9cb0ff),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(Icons.more_horiz,color: Colors.white,),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('\$3,734 ',style: TextStyle(fontSize: 35,fontWeight:FontWeight.bold,fontFamily: 'H1fonts',color: Colors.white),),
                      Text('/ \$4000 per month',style: TextStyle(fontSize: 18,fontFamily: 'H1fonts',color: Colors.grey[400]),),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Container(
                        width: 310,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.orange[200],
                          borderRadius: BorderRadius.circular(4)
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.only(topRight:Radius.circular(4),bottomRight: Radius.circular(4))
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Expense Breakdown',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,fontFamily: 'H1fonts'),),
                InkWell(
                  onTap: (){
                    // do your operation
                    print('this is click able button');
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffebf0fc),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Week',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600,fontFamily: 'H1fonts'),),
                        Icon(Icons.arrow_drop_down_outlined,size: 30,),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Text('Limit \$900 / week',style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600 ,fontFamily: 'H1fonts',color: Colors.grey[600]),),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 240,
              color: Colors.grey,
              child: Center(child: Text('This is sapce for chart',style: TextStyle(fontSize: 20),)),
            ),
            SizedBox(height: 20),
            Text('Spending Details',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,fontFamily: 'H1fonts'),),
            Text('Your expense are divided into 6 categories',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600 ,fontFamily: 'H1fonts',color: Colors.grey[600]),),
            SizedBox(height: 10),
            Row(
              children: [
              Container(
              width: 100,
              height: 14,
              decoration: BoxDecoration(
                  color: Colors.blueAccent[400],
                  borderRadius: BorderRadius.circular(2)
              ),
            ),
                Container(
                  width: 80,
                  height: 14,
                  decoration: BoxDecoration(
                      color: Colors.pink[400],
                      borderRadius: BorderRadius.circular(2)
                  ),
                ),
                Container(
                  width: 70,
                  height: 14,
                  decoration: BoxDecoration(
                      color: Colors.yellow[400],
                      borderRadius: BorderRadius.circular(2)
                  ),
                ),
                Container(
                  width: 60,
                  height: 14,
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(2)
                  ),
                ),
                Container(
                  width: 40,
                  height: 14,
                  decoration: BoxDecoration(
                      color: Colors.red[500],
                      borderRadius: BorderRadius.circular(2)
                  ),
                ),
                Container(
                  width: 40,
                  height: 14,
                  decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(2)
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('40%',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600 ,fontFamily: 'H1fonts',color: Colors.grey[600])),
                SizedBox(width: 55,),
                Text('25%',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600 ,fontFamily: 'H1fonts',color: Colors.grey[600])),
                SizedBox(width: 40,),
                Text('15%',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600 ,fontFamily: 'H1fonts',color: Colors.grey[600])),
                SizedBox(width: 45,),
                Text('10%',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600 ,fontFamily: 'H1fonts',color: Colors.grey[600])),
                SizedBox(width: 25,),
                Text('5%',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600 ,fontFamily: 'H1fonts',color: Colors.grey[600])),
                SizedBox(width: 15,),
                Text('5%',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600 ,fontFamily: 'H1fonts',color: Colors.grey[600])),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,childAspectRatio: 4/2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
                 itemCount: statisticData.length,
                  itemBuilder: (_,index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5,color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: statisticData[index]['color'],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Icon(statisticData[index]['icons'],size: 35,color: Colors.black,)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(statisticData[index]['work'],style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,fontFamily: 'H1fonts'),),
                          Text(statisticData[index]['price'],style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,fontFamily: 'H1fonts',color: Colors.pink[400]),),
                        ],
                      )
                    ],
                  ),
                );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}