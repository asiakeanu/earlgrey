//
//  GameScene.m
//  earlgrey
//
//  Created by Hirofumi Tanigami on 12/10/14.
//  Copyright (c) 2014 SO14. All rights reserved.
//  TakatoshiMasamori  

// RikuSaito
// Hirofumi Tanigami
// Yuta Tamura
// Ajia Suzuki
// Takashi Ikemori
// chagawa yacchan
// mori yuuya


#import "GameScene.h"
SKTexture *_texture;

@implementation GameScene {
    SKSpriteNode *shit;
    SKSpriteNode *purin;
    SKLabelNode *myLabel;
}
//うんこの生成
-(void) setUpShit{
    shit = [SKSpriteNode spriteNodeWithImageNamed:@"shit"];
    shit.size = CGSizeMake(25, 25);
    shit.position = CGPointMake(self.size.width / 2, self.size.height /2);
    shit.physicsBody.dynamic = NO;
    shit.name = @"shit";
    [self addChild:shit];
}
//プリンの生成
-(void) setUpPurin{
    purin = [SKSpriteNode spriteNodeWithImageNamed:@"purin.jpeg"];
    purin.size = CGSizeMake(25, 25);
    purin.position = CGPointMake(self.size.width / 2, self.size.height /2);
    purin.physicsBody.dynamic = NO;
    purin.name = @"purin";
    [self addChild:purin];
}


//いろんな生成
-(void)didMoveToView:(SKView *)view {
    SKSpriteNode *sprite1 = [SKSpriteNode spriteNodeWithImageNamed:@"shit"];
    sprite1.xScale = 0.5;
    sprite1.yScale = 0.5;
    sprite1.position = CGPointMake(self.size.width / 2 +50,
                                   self.size.height /2 - 100);
    sprite1.name = @"shit";
    
    
    SKSpriteNode *sprite2 = [SKSpriteNode spriteNodeWithImageNamed:@"purin.jpeg"];
    sprite2.xScale = 0.3;
    sprite2.yScale = 0.3;
    sprite2.position = CGPointMake(self.size.width / 2 - 50,
                                   self.size.height /2 + 100);
    sprite2.name = @"purin";

    myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"スコア";
    myLabel.fontSize = 30;
    myLabel.position = CGPointMake(self.size.width /2 - 200,
                                   self.size.height /2 + 350);
    //スコア
    SKLabelNode *scoreNode = [SKLabelNode labelNodeWithFontNamed:@"Baskerville-Bold"];
    scoreNode.name = kScoreName;
    scoreNode.fontSize = 20;
    self.score = 0;
    [self addChild:scoreNode];
    scoreNode.position = CGPointMake(self.size.width / 2, self.size.height / 2 + 350);
    [self addChild:sprite2];
    [self addChild:sprite1];
    [self addChild:myLabel];
}


// タッチ
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];

        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:_texture];
        sprite.position = location;
        myLabel.text = @"スコア";
        
        SKNode *node = [self nodeAtPoint:location];
        
        if(node != nil && [node.name isEqualToString:@"shit"]) {
            [node removeFromParent];
            self.score += 10;
        } else {
        SKNode *node1 = [self nodeAtPoint:location];
        if(node1 != nil && [node1.name isEqualToString:@"purin"]) {
            [node1 removeFromParent];
            self.score -= 10;

            break;
        }
    }
  }
}



//スコア更新
-(void)setScore:(int)score
{
    _score = score;
    //ラベル更新
    SKLabelNode* scoreNode;
    scoreNode = (SKLabelNode*)[self childNodeWithName:kScoreName];
    scoreNode.text = [NSString stringWithFormat:@"%d", _score];
}




-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
