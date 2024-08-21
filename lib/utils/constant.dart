import 'package:flutter/widgets.dart';

var image =
    'https://scontent.fcgp17-1.fna.fbcdn.net/v/t39.30808-6/432934437_379672724910396_8625477020084735141_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeG5BsXZvr2Sg6GlHC8y6Se1LhOu4QnDi98uE67hCcOL33QU7tkhiOymrj4PTEF3bxUKl3EBOsDIKYGCc6rHW1Xw&_nc_ohc=k6czQtmUyh0Q7kNvgHwtgbY&_nc_ht=scontent.fcgp17-1.fna&oh=00_AYBc7JWboKXLTOC7OGXq6fBCddNBmLzQvYdv6HZUbL83TQ&oe=66C75C94';

double getMaxHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getMaxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
