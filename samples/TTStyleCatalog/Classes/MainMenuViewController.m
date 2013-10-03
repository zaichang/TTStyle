//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "MainMenuViewController.h"
#import "StyleViewController.h"


static NSString *kTitleKey = @"title";
static NSString *kStyleKey = @"style";
static NSString *kTypeKey = @"type";



///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MainMenuViewController


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithStyle:(UITableViewStyle)style
{
	if (self = [super initWithStyle:style])
	{
		self.title = @"Style Catalog";

    dataSource =
      [NSArray arrayWithObjects:
//       @"Text Styles",
       [NSDictionary dictionaryWithObjectsAndKeys:@"Link Text", kTitleKey,
                                 @"linkText:", kStyleKey, @"text", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Mini Badge", kTitleKey,
                                 @"miniBadge", kStyleKey, @"text", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Badge", kTitleKey,
                                 @"badge", kStyleKey, @"text", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Large Badge", kTitleKey,
                                 @"largeBadge", kStyleKey, @"text", kTypeKey, nil],

//       @"Views",
       [NSDictionary dictionaryWithObjectsAndKeys:@"Post Text Editor", kTitleKey,
                                 @"postTextEditor", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Photo Caption", kTitleKey,
                                 @"photoCaption", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Photo Status Label", kTitleKey,
                                 @"photoStatusLabel", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Page Dot", kTitleKey,
                                 @"pageDot:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Highlighted Link", kTitleKey,
                                 @"linkHighlighted", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Table Header", kTitleKey,
                                 @"tableHeader", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Picker Cell", kTitleKey,
                                 @"pickerCell:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Search Table Shadow", kTitleKey,
                                 @"searchTableShadow", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Black Bezel", kTitleKey,
                                 @"blackBezel", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"White Bezel", kTitleKey,
                                 @"whiteBezel", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Black Banner", kTitleKey,
                                 @"blackBanner", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Bar", kTitleKey,
                                 @"tabBar", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Strip", kTitleKey,
                                 @"tabStrip", kStyleKey, @"view", kTypeKey, nil],

//       @"Tab Grid",
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Grid", kTitleKey,
                                 @"tabGrid", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Grid Top Left", kTitleKey,
                                 @"tabGridTabTopLeft:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Grid Top Right", kTitleKey,
                                 @"tabGridTabTopRight:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Grid Bottom Right", kTitleKey,
                                 @"tabGridTabBottomRight:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Grid Bottom Left", kTitleKey,
                                 @"tabGridTabBottomLeft:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Grid Left", kTitleKey,
                                 @"tabGridTabLeft:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Grid Right", kTitleKey,
                                 @"tabGridTabRight:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Grid Center", kTitleKey,
                                 @"tabGridTabCenter:", kStyleKey, @"view", kTypeKey, nil],

//       @"Tabs",
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab"
                                 @"tab:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Round Tab"
                                 @"tabRound:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Left Overflow"
                                 @"tabOverflowLeft", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Tab Right Overflow"
                                 @"tabOverflowRight", kStyleKey, @"view", kTypeKey, nil],

//       @"Images",
       [NSDictionary dictionaryWithObjectsAndKeys:@"Thumb View"
                                 @"thumbView:", kStyleKey, @"image", kTypeKey, nil],

//       @"Launcher",
       [NSDictionary dictionaryWithObjectsAndKeys:@"Launcher Button"
                                 @"launcherButton:", kStyleKey, @"image", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Launcher Close Button"
                                 @"launcherCloseButton:", kStyleKey, @"view", kTypeKey, nil],

//       @"Text Bar",
       [NSDictionary dictionaryWithObjectsAndKeys:@"Text Bar"
                                 @"textBar", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Text Bar Footer"
                                 @"textBarFooter", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Text Bar Text Field"
                                 @"textBarTextField", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Text Bar Post Button"
                                 @"textBarPostButton:/text", kStyleKey, @"text", kTypeKey, nil],

//       @"Toolbars",
       [NSDictionary dictionaryWithObjectsAndKeys:@"Toolbar Button"
                                 @"toolbarButton:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Toolbar Back Button"
                                 @"toolbarBackButton:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Toolbar Forward Button"
                                 @"toolbarForwardButton:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Toolbar Round Button"
                                 @"toolbarRoundButton:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Black Toolbar Button"
                                 @"blackToolbarButton:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Gray Toolbar Button"
                                 @"grayToolbarButton:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Black Toolbar Forward Button"
                                 @"blackToolbarForwardButton:", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Black Toolbar Round Button"
                                 @"blackToolbarRoundButton:", kStyleKey, @"view", kTypeKey, nil],

//       @"Search",
       [NSDictionary dictionaryWithObjectsAndKeys:@"Search Text Field"
                                 @"searchTextField", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Search Bar"
                                 @"searchBar", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Search Bar Bottom"
                                 @"searchBarBottom", kStyleKey, @"view", kTypeKey, nil],
       [NSDictionary dictionaryWithObjectsAndKeys:@"Black Search Bar"
                                 @"blackSearchBar", kStyleKey, @"view", kTypeKey, nil],

       nil];

		[dataSource retain];
  }

  return self;
}


-(void) viewDidLoad
{
	[super viewDidLoad];
	
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
	return dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
	}
	
	NSDictionary *item = [dataSource objectAtIndex:indexPath.row];
	NSString *title = [item objectForKey:kTitleKey];
	cell.textLabel.text = title;
	
	return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSDictionary *item = [dataSource objectAtIndex:indexPath.row];
	NSString *style = [item objectForKey:kStyleKey];
	NSString *type = [item objectForKey:kTypeKey];
	
	StyleViewController *controller = [[[StyleViewController alloc] initWithStyleName:style styleType:type] autorelease];
	[self.navigationController pushViewController:controller animated:YES];
}


@end

