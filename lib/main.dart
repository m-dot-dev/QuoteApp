
import 'package:flutter/material.dart';
import 'quote.dart';

void main() {
  runApp(MaterialApp(
    home:QuoteHome(),
  ));
}
// ignore: non_constant_identifier_names


class QuoteHome extends StatefulWidget {
  @override
  _QuoteHomeState createState() => _QuoteHomeState();
}

class _QuoteHomeState extends State<QuoteHome> {
  List<Quote> quoteList = [
    Quote(
        QuoteText: "I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.",
        Image: "assets/Marilyn_Monroe.jpg",
        Author: "Marilyn Monroe"),
    Quote(
        QuoteText: "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
        Image: "assets/Albert Einstein.jpg",
        Author: "Albert Einstein"),
    Quote(
        QuoteText: "You've gotta dance like there's nobody watching,\nLove like you'll never be hurt,\nSing like there's nobody listening,\nAnd live like it's heaven on earth.",
        Image: "assets/William W. Purkey.jpg",
        Author: "William W. Purkey"),
    Quote(
        QuoteText: "You know you're in love when you can't fall asleep because reality is finally better than your dreams.",
        Image: "assets/Dr. Seuss.jpg",
        Author: "Dr. Seuss"),
    Quote(
        QuoteText: "You only live once, but if you do it right, once is enough.",
        Image: "assets/Mae West.jpg",
        Author: "Mae West"),
  ];
  int counter = 0;

  

  @override
  Widget build(BuildContext context) {
    Quote quote = quoteList.elementAt(counter);
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        shadowColor: Colors.transparent,
        title: Text(
          "Different Quotes".toUpperCase(),
          style: TextStyle(
            fontFamily: "IndieFlower",
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(

            margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  SizedBox(height: 40,),
                  Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(quote.Image),
                      backgroundColor: Colors.transparent  ,

                    ),
                  ),
                  Divider(height: 90.0, thickness: 1,color: Colors.grey[800],),
                  Expanded(
                    flex:5,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16.0,0,0,16.0),
                        child: Text(
                          quote.QuoteText,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'IndieFlower',
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(

                    child: Container(

                      color: Colors.grey[900],
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16.0,10.0,0,0),
                        child: Text(
                          quote.Author,
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
                ]
            )

        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            counter= (counter+1)%(quoteList.length);
            quote = quoteList.elementAt(counter);
          });
        },
        backgroundColor: Colors.grey[800],
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),

    );
  }

}


