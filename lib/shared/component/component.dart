import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/webView/webview.dart';
import '../Cubit/cubit.dart';

Widget buildArticleItem(news,context){
  return InkWell(
    onTap: (){
      navigateTo(context, WebViewScreen('${news['url']}'));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width:120 ,
            height:120 ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('${news['urlToImage']}'),
                    fit: BoxFit.cover
                )
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${news['title']}',
                      style:Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow:TextOverflow.ellipsis ,
                    ),
                  ),
                  Text(
                    '${news['publishedAt']}',
                    style: TextStyle(
                        color: Colors.grey
                    ),

                  )

                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget MyDivider(){
  return Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  );
}


Widget articlerBuilder(list,{isSearch=false}){
  return ConditionalBuilder(
    condition: list.length>0,
    builder: (BuildContext context) {


      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return buildArticleItem( list[index],context);
          },
          separatorBuilder: (context,index){

            return MyDivider();
          },
          itemCount: list.length);
    },
    fallback: (BuildContext context) {return isSearch ?  Container(): Center(child: CircularProgressIndicator(),);
    },

  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  IconData ?suffixIcon,
  bool isPass=false,
  Function()? showPass,
  Function()? onTab,

  required String label,
  required IconData prefixIcon,
  required String kind,
  required Function(String value) onChange,
  context

}) {
  return TextFormField(
    controller: controller,
    onTap: onTab,
    keyboardType: type,
    obscureText: isPass,
    onChanged: onChange,
    validator: (String? value) {
      if (value!.isEmpty) {
        return '$kind must not be Empty';
      }
      return null;
    },

    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(onPressed: showPass, icon: Icon(suffixIcon),),
        labelStyle: TextStyle(
            color: Colors.white
        ),
        prefixStyle: TextStyle(
            backgroundColor: Colors.white
        )


    ),
  );
}

void navigateTo(context,widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}
