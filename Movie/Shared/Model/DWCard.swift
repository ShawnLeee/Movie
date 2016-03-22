//
//  DWCard.swift
//  Movie
//
//  Created by Daniel on 16/3/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//
import ObjectMapper
class DWPic:DWMappable
{
    var pic:String?
    required init?(_ map: Map) {
    }
    func mapping(map: Map) {
        pic <- map[JSONField.pic.rawValue]
    }
    enum JSONField:String
    {
        case pic
    }
}
class DWCardItem:DWMappable
{
    var titleSub:String?
    var scheme:String?
    var icon:String?
    var titleSubColor:Int?
    required init?(_ map: Map) {
    }
    func mapping(map: Map) {
        titleSub <- map[JSONField.title_sub.rawValue]
        scheme <- map[JSONField.scheme.rawValue]
        icon <- map[JSONField.icon.rawValue]
        titleSubColor <- map[JSONField.title_sub_color.rawValue]
    }
    enum JSONField:String
    {
        case title_sub,icon,scheme,title_sub_color
    }
}
class DWMblog : DWMappable
{
    var createdAt:String?
    var text:String?
    var source:String?
    var repostsCount:Int?
    var commentsCount:Int?
    var attitudesCount:Int?
    var user:DWWeiboUser?
    required init?(_ map: Map) {
        
    }
    func mapping(map: Map) {
        createdAt <- map[JSONField.created_at.rawValue]
        text <- map[JSONField.text.rawValue]
        source <- map[JSONField.source.rawValue]
        repostsCount <- map[JSONField.reposts_count.rawValue]
        commentsCount <- map[JSONField.comments_count.rawValue]
        attitudesCount <- map[JSONField.attitudes_count.rawValue]
        user <- map[JSONField.user.rawValue]
    }
    enum JSONField:String
    {
        case created_at,text,source,reposts_count,comments_count,attitudes_count,user
    }
}
class DWCard : DWMappable  {
    var cardType:CardType?
    var picItems:[DWPic]?
    var cardGroup:[DWCard]?
    var pic:String?
    var desc:String?
    var titleExtraText:String?
    var displayArrow:Bool?
    var group:[DWCardItem]?
    var mblog:DWMblog?
    var headTitle:String?
    var hasCardGroup:Bool{
        switch cardType!
        {
        case .HasCardGroup:
            return true
        default:return false
        }
    }
    required init?(_ map: Map) {
    }
}
extension DWCard
{
    func mapping(map: Map) {
        picItems <- map[JSONField.pic_items.rawValue]
        cardType <- map[JSONField.card_type.rawValue]
        cardGroup <- map[JSONField.card_group.rawValue]
        pic <- map[JSONField.pic.rawValue]
        desc <- map[JSONField.desc.rawValue]
        titleExtraText <- map[JSONField.title_extra_text.rawValue]
        displayArrow <- map[JSONField.display_arrow.rawValue]
        group <-  map[JSONField.group.rawValue]
        mblog <- map[JSONField.mblog.rawValue]
        headTitle <- map[JSONField.title.rawValue]
    }
    enum JSONField:String
    {
        case pic_items,card_type,card_group,pic,desc,title_extra_text,display_arrow,group,mblog,title
    }
    enum CardType:Int
    {
        case Pictures = 22//  图片浏览器
        case More = 42//desc,title_extra,display_arrow
        case FourTitles = 17//has group
        case TwoTitleAndPic = 16//has group
        case OneTitleAndPic = 4//no cardGroup
        case Mblog = 9
        case HasCardGroup = 11
        func cellItentifier() -> String
        {
            switch self
            {
            case .Pictures:
                return DWPicsCell.reuseIdentifier
            case .More:
                return DWMoreCell.reuseIdentifier
            case .FourTitles:
                return DWFourTitleCell.reuseIdentifier
            case .TwoTitleAndPic:
                return DWTwoTitleCell.reuseIdentifier
            case .OneTitleAndPic:
                return DWSingleCell.reuseIdentifier
            case .Mblog:
                return DWMblogCell.reuseIdentifier
            default:return ""
            }
        }
    }
    
}
