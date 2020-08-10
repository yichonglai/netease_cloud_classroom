import 'package:flutter/material.dart';
import 'package:netease_cloud_classroom/widgets/static_search_widget.dart';

class Classify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return generateTabPage();
  }
}

const _tabs = ['个性推荐', '课堂', '微专业'];
DefaultTabController generateTabPage() {
  return DefaultTabController(
    initialIndex: 1,
    length: _tabs.length,
    child: Text('Classify'),
  );
}

// NestedScrollView(
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return <Widget>[
//           SliverOverlapAbsorber(
//             handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//             sliver: SliverAppBar(
//               pinned: true,
//               expandedHeight: 120.0,
//               primary: true,
//               titleSpacing: 0.0,
//               backgroundColor: Colors.white,
//               forceElevated: innerBoxIsScrolled,
//               flexibleSpace: FlexibleSpaceBar(
//                 collapseMode: CollapseMode.pin,
//                 background: Container(
//                   color: Colors.white,
//                   child: StaticSearchWidget(
//                     hintText: '网易云课堂',
//                     margin: const EdgeInsets.only(left: 15.0, right: 15.0),
//                     onTab: () {
//                       // Router.push(context, Router.searchPage, '影视作品中你难忘的离别');
//                     },
//                   ),
//                   alignment: Alignment(0.0, 0.0),
//                 ),
//               ),
//               bottom: TabBar(
//                 indicatorWeight: 2.0,
//                 indicatorSize: TabBarIndicatorSize.label,
//                 indicatorColor: Color.fromRGBO(51, 177, 123, 1),
//                 labelColor: Color.fromRGBO(51, 177, 123, 1),
//                 labelStyle: TextStyle(fontSize: 14),
//                 unselectedLabelColor: Color.fromRGBO(80, 80, 80, 1),
//                 tabs: _tabs.map((String name) => Tab(text: name)).toList(),
//               ),
//             ),
//           ),
//         ];
//       },
//       body: TabBarView(
//         // These are the contents of the tab views, below the tabs.
//         children: _tabs.map((String name) {
//           return SafeArea(
//             top: false,
//             bottom: false,
//             child: Builder(
//               // This Builder is needed to provide a BuildContext that is
//               // "inside" the NestedScrollView, so that
//               // sliverOverlapAbsorberHandleFor() can find the
//               // NestedScrollView.
//               builder: (BuildContext context) {
//                 return CustomScrollView(
//                   // The "controller" and "primary" members should be left
//                   // unset, so that the NestedScrollView can control this
//                   // inner scroll view.
//                   // If the "controller" property is set, then this scroll
//                   // view will not be associated with the NestedScrollView.
//                   // The PageStorageKey should be unique to this ScrollView;
//                   // it allows the list to remember its scroll position when
//                   // the tab view is not on the screen.
//                   key: PageStorageKey<String>(name),
//                   slivers: <Widget>[
//                     SliverOverlapInjector(
//                       // This is the flip side of the SliverOverlapAbsorber
//                       // above.
//                       handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
//                           context),
//                     ),
//                     SliverPadding(
//                       padding: const EdgeInsets.all(8.0),
//                       // In this example, the inner scroll view has
//                       // fixed-height list items, hence the use of
//                       // SliverFixedExtentList. However, one could use any
//                       // sliver widget here, e.g. SliverList or SliverGrid.
//                       sliver: SliverFixedExtentList(
//                         // The items in this example are fixed to 48 pixels
//                         // high. This matches the Material Design spec for
//                         // ListTile widgets.
//                         itemExtent: 48.0,
//                         delegate: SliverChildBuilderDelegate(
//                           (BuildContext context, int index) {
//                             // This builder is called for each child.
//                             // In this example, we just number each list item.
//                             return ListTile(
//                               title: Text('Item $index'),
//                             );
//                           },
//                           // The childCount of the SliverChildBuilderDelegate
//                           // specifies how many children this inner list
//                           // has. In this example, each tab has a list of
//                           // exactly 30 items, but this is arbitrary.
//                           childCount: 30,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           );
//         }).toList(),
//       ),
//     )
