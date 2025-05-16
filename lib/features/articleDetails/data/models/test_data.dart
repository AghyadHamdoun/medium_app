
import 'article_model.dart';

final List<Article> articles = [
  Article(
    id: '1',
    title: 'Unlocking the Power of AI: A Comprehensive Guide',
    content: 'Artificial intelligence (AI) is revolutionizing...',
    author: 'Alice Johnson',
    date: DateTime.now().subtract(const Duration(days: 1)),
    imageUrl:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnJH-KAZYhuHlptMPo-rJahmzVXIpBEZ9j4g&s', // Real image URL
    likes: 15,
    comments: ['Amazing insights!', 'Well-written and informative.'],
    shortDescription: 'A deep dive into the world of AI.',
    authorImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgu8cvJBA4GB-KIsh8vcTrOR4lHX40DX0a9w&s'
  ),
  Article(
    id: '2',
    title: 'The Future of Mobile App Development',
    content: 'Mobile apps have become an integral part...',
    author: 'Bob Williams',
    date: DateTime.now().subtract(const Duration(days: 3)),
    imageUrl:
    'https://images.pexels.com/photos/1181245/pexels-photo-1181245.jpeg', // Real image URL
    likes: 22,
    comments: ['Love this perspective!', 'Great read.'],
    shortDescription: 'Exploring the trends shaping mobile app development.',
    authorImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXg9k5fHy--R9x2Q8cuvxeQ8TriABt_HJGUQ&s', // Real author image URL
  ),
  Article(
    id: '3',
    title: 'Sustainable Tech: Innovations for a Greener Future',
    content: 'Technology plays a crucial role in addressing...',
    author: 'Charlie Brown',
    date: DateTime.now().subtract(const Duration(days: 5)),
    imageUrl:
    'https://images.pexels.com/photos/1307690/pexels-photo-1307690.jpeg', // Real image URL
    likes: 35,
    comments: ['Inspiring!', 'Eye-opening and thought-provoking.'],
    shortDescription: 'Exploring tech solutions for environmental challenges.',
    authorImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3JLn2p-tH08kSNV7YGAM6FAqDshY44YzwrQ&s', // Real author image URL
  ),
  Article(
    id: '4',
    title: 'The Rise of E-commerce: Transforming Retail',
    content: 'E-commerce has revolutionized the way we shop...',
    author: 'Diana Davis',
    date: DateTime.now().subtract(const Duration(days: 7)),
    imageUrl:
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgzxVxXZB1KCXK4H9CRrE8SOMUwvPcs3bZyw&s', // Real image URL
    likes: 28,
    comments: ['Informative and insightful.', 'Great overview of the e-commerce landscape.'],
    shortDescription: 'Analyzing the impact of e-commerce on retail.',
    authorImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRazGKny1CSlH3XZGzdceONvBwSZqNVKklLnA&s', // Real author image URL
  ),
];


