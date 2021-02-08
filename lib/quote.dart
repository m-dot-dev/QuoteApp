import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Quote {
  String quoteText;
  String author;
  String image;
  String tag;
  Quote({this.quoteText,this.image,this.author,this.tag});
}

class QuoteCardMaker extends StatelessWidget {
  const QuoteCardMaker({
    Key key,
    @required this.quote,
  }) : super(key: key);

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: true,
        color: Colors.white.withOpacity(0.65),
        margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 16.0, 0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'CATEGORY:  '+quote.tag.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Montserrat',
                      color: Colors.blueGrey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(height: 90.0, thickness: 1,color: Colors.grey[800],),
              Expanded(
                flex:5,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,0,0,16.0),
                    child: Text(
                      quote.quoteText,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'IndieFlower',
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(

                child: Container(

                  color: Colors.grey[900].withOpacity(0.65),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,10.0,0,0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        quote.author,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]
        )

    );
  }
}


class QuoteDisplay extends StatefulWidget {
  @override
  _QuoteDisplay createState() => _QuoteDisplay();
}

class _QuoteDisplay extends State<QuoteDisplay> {
  // List<Quote> quoteList = [
  //   Quote(
  //       QuoteText: "I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.",
  //       Image: "assets/Marilyn_Monroe.jpg",
  //       Author: "Marilyn Monroe"),
  //   Quote(
  //       QuoteText: "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
  //       Image: "assets/Albert Einstein.jpg",
  //       Author: "Albert Einstein"),
  //   Quote(
  //       QuoteText: "You've gotta dance like there's nobody watching,\nLove like you'll never be hurt,\nSing like there's nobody listening,\nAnd live like it's heaven on earth.",
  //       Image: "assets/William W. Purkey.jpg",
  //       Author: "William W. Purkey"),
  //   Quote(
  //       QuoteText: "You know you're in love when you can't fall asleep because reality is finally better than your dreams.",
  //       Image: "assets/Dr. Seuss.jpg",
  //       Author: "Dr. Seuss"),
  //   Quote(
  //       QuoteText: "You only live once, but if you do it right, once is enough.",
  //       Image: "assets/Mae West.jpg",
  //       Author: "Mae West"),
  // ];
  // int counter = 0;
  Map quotedata;
  @override
  Widget build(BuildContext context){

    quotedata = quotedata==null ? ModalRoute.of(context).settings.arguments:quotedata;
    String str ='';

    Quote quote = new Quote(quoteText: quotedata['content'],image: quotedata['image'],author: quotedata['author'],tag: quotedata['tags'].map((tag) => tag+str).toString());

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            quotedata['image'],
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: SizedBox(height: 5,)),
              Expanded(
                flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child:  FlatButton.icon(

                      padding: EdgeInsets.all(7),
                        onPressed: ()async{
                            dynamic returned = await Navigator.pushNamed(context, '/load_categories');
                            try{
                              setState(() {
                                quotedata = {
                                  'content':returned['content'],
                                  'image':returned['image'],
                                  'author':returned['author'],
                                  'tags':returned['tags'],
                                };
                              });
                            }catch(e){}

                        },
                        icon: Icon(
                            Icons.category,
                        ),
                        label: Text(
                          'Categories',
                          style:TextStyle(
                            color: Colors.white
                          ),

                        ),

                        color: Colors.blueGrey.withOpacity(0.55)
                    ),
                  )
              ),
              Expanded(
                flex: 20,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,2.0,20.0,20.0),
                    child: QuoteCardMaker(quote: quote)
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              Navigator.pushReplacementNamed(context, '/');
            });
          },

          backgroundColor: Colors.grey[800],
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),

      ),
    );
  }


}


