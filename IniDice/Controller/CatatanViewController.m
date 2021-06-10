//
//  CatatanViewController.m
//  IniDice
//
//  Created by iei19100004 on 28/05/21.
//

#import "CatatanViewController.h"
#import "ResultViewController.h"
#import "MemberTableViewCell.h"
#import "MemberModel.h"
#import "MemberDetailViewController.h"

@interface CatatanViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation CatatanViewController

NSString *identifier = @"MemberCell";
NSArray *members;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Member ANJAY";
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    members = [[NSArray alloc]init];
    
    [self getMembersData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MemberTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
}

- (NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"member" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (void)getMembersData
{
    NSDictionary *dict = [self JSONFromFile];
    NSArray *memberData = [dict objectForKey:@"data"];
    NSMutableArray *getMember = [[NSMutableArray alloc] init];
    
    for (NSDictionary *member in memberData) {
        NSString *name = [member objectForKey:@"name"];
        NSString *role = [member objectForKey:@"role"];
        NSString *birthPlace = [member objectForKey:@"birthPlace"];
        NSString *address = [member objectForKey:@"address"];
        NSString *hobby = [member objectForKey:@"hobby"];
        NSString *motivation = [member objectForKey:@"motivation"];
        NSString *image = [member objectForKey:@"image"];
        MemberModel *memberModel = [[MemberModel alloc] initWithName:name role:role birthPlace:birthPlace address:address hobby:hobby motivation:motivation image:image];
        [getMember addObject:memberModel];
    };
    
    members = getMember;
    
}


- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MemberTableViewCell *memberCell = [self.tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    memberCell.selectionStyle = UITableViewCellSelectionStyleNone;
    MemberModel *memberData = [[MemberModel alloc] init];
    memberData = members[indexPath.row];
    memberCell.memberName.text = memberData.name;
    memberCell.memberRole.text = memberData.role;
    memberCell.memberImage.image = [UIImage imageNamed:memberData.image];
    memberCell.memberImage.layer.cornerRadius = memberCell.memberImage.frame.size.height/2;
    memberCell.memberImage.layer.masksToBounds = YES;
    memberCell.memberImage.layer.borderWidth = 0;
    return memberCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return members.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MemberDetailViewController *memberDetail = [[MemberDetailViewController alloc] initWithNibName:@"MemberDetailViewController" bundle:nil];
    memberDetail.memberModel = members[indexPath.row];
    [self.navigationController pushViewController:memberDetail animated:YES];
}


@end
