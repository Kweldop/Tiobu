import 'package:flutter/material.dart';
import 'creatortile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          iconSize: 35,
        ),
        title: Row(
          children: const [
            Icon(Icons.circle_outlined,size: 35),//This is a demo icon
            SizedBox(width: 10,),
            Text('TIOBU',
              style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 5
              ),
            ),
          ],
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/cat.png'),
          ),
          SizedBox(width: 15,),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Recommended Creators',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 25,),
            Wrap(
              spacing: 15,
              children: const [
                Creator(id: 'C1',name: 'Carryminati',profession: 'Youtuber',imageUrl: 'https://imgs.search.brave.com/kS789vC90cpce2n_lW93sAa8xGiFwnbkwDrR2OmrBPk/rs:fit:1200:720:1/g:ce/aHR0cHM6Ly9pbWcu/Z3VydWdhbWVyLmNv/bS8yMDIwLzAyLzEx/L2NhcnJ5bWluYXRp/LTItM2QyMC5qcGc'),
                Creator(id: 'C2',name: 'Bhuvam bam', profession: 'Youtuber', imageUrl: 'https://imgs.search.brave.com/F709lDLcPE6scxo95S38AMLYGBpDDltJ1vJc5WX83lA/rs:fit:700:415:1/g:ce/aHR0cHM6Ly93d3cu/aW5kaWEuY29tL3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE4LzA5/L0JodXZhbi1CYW0u/anBn'),
                Creator(id: 'C3',name: 'Divine', profession: 'Singer', imageUrl: 'https://imgs.search.brave.com/HjkZBYcESwAGJoP2W3KnycbULFsKLaZeRkl822Jaqfs/rs:fit:1200:1080:1/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJhY2Nlc3Mu/Y29tL2Z1bGwvNDY2/MjgwNS5qcGc'),
                Creator(id: 'C4',name: 'Elon Musk', profession: 'CEO', imageUrl: 'https://imgs.search.brave.com/h6w-aJw5xeP0-DXaNBGzVh6uG4dc1LkjPRPSTpwWWZo/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93d3cu/YnVzaW5lc3NpbnNp/ZGVyLmluL3Bob3Rv/Lzc3NzgyNTAwL2Vs/b24tbXVzay1pcy1u/b3ctd29ydGgtMTAw/LWJpbGxpb24taGFs/Zi1vZi1qZWZmLWJl/em9zLmpwZz9pbWdz/aXplPTI0MTk2Mw'),
                Creator(id: 'C5',name: 'Isayama', profession: 'Writer', imageUrl: 'https://imgs.search.brave.com/i43dDdzuC0bFg1HqdaClN6_kPPrRUTy5dKUpld-yNyU/rs:fit:672:372:1/g:ce/aHR0cHM6Ly9haGVn/YW8uYi1jZG4ubmV0/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDE5/LzAxL0hhamltZS1J/c2F5YW1hLmpwZw'),
                Creator(id: 'C6',name: 'Messi', profession: 'Athlete', imageUrl: 'https://imgs.search.brave.com/m_hqpdlfWboqLSkS2fvKYN6NFlul6It3gNmSJgw3ZYE/rs:fit:1024:682:1/g:ce/aHR0cHM6Ly9zMS5p/YnRpbWVzLmNvbS9z/aXRlcy93d3cuaWJ0/aW1lcy5jb20vZmls/ZXMvc3R5bGVzL2Z1/bGwvcHVibGljLzIw/MjAvMDkvMDQvbGlv/bmVsLW1lc3NpLXNh/aWQtaGUtd2lsbC1z/dGF5LWF0LWJhcmNl/bG9uYS5qcGc')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
