//
//  ExampleCustomTableViewCell.m
//  CustomModel
//
//  Created by fangd@silviscene.com on 2018/1/11.
//  Copyright © 2018年 sky. All rights reserved.
//

#import "ExampleCustomTableViewCell.h"
#import "ExampleCustomModel.h"
@interface ExampleCustomTableViewCell ()
@end
@implementation ExampleCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
-(void)setModel:(ManModel *)model
{
    _model = model;
    self.textLabel.text = [NSString stringWithFormat:@"名字:%@ 性别:%@ 爱好:%@",model.NAME,model.SEX,model.HOBBY];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
