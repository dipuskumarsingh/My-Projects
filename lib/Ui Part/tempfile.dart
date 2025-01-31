ListView.builder(
itemCount: ExpenseData.length,
scrollDirection: Axis.vertical,
itemBuilder: (context,index){
return Row(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Container(
margin: EdgeInsets.only(top: 20),
width: 60,
height: 60,
decoration: BoxDecoration(
color: ExpenseData[index]['color'],
borderRadius: BorderRadius.circular(10),
),
child: Icon(ExpenseData[index]['icons'],size: 35,color: Colors.blue,),
),
SizedBox(width: 20),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(ExpenseData[index]['work'],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,fontFamily: 'H1fonts'),),
Text(ExpenseData[index]['workDetails'],style: TextStyle(fontSize: 20,fontFamily: 'H1fonts',color:Colors.grey )),
],

),
SizedBox(width: 30),
Text(ExpenseData[index]['price'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.red[400]),)

],
);
}),