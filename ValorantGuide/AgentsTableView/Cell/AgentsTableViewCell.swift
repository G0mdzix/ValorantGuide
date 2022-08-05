import Foundation
import UIKit
import SnapKit

class AgentsTableViewCell: UITableViewCell {

    var gradientLayer: CAGradientLayer = CAGradientLayer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = contentView.frame
    }
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let agentIconImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let agentNameLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let agentTitleDetailedLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let agentDescritpionLabel:UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor =  .white
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        gradientLayer.colors = [Colors.dark.cgColor, Colors.red.cgColor ]
        contentView.layer.insertSublayer(gradientLayer, at: 0)
        
        self.contentView.addSubview(agentIconImageView)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(agentDescritpionLabel)
        self.containerView.addSubview(agentNameLabel)
        self.containerView.addSubview(agentTitleDetailedLabel)

        agentIconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.topMargin.equalToSuperview()
            make.size.equalTo(75)
        }
        
      containerView.snp.makeConstraints{ make in
            make.size.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(agentIconImageView.snp.bottom)
        }
        
        agentNameLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.centerX.equalTo(contentView)
          }
        
        agentTitleDetailedLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(40)
            make.centerX.equalTo(contentView)
          }
        
        agentDescritpionLabel.snp.makeConstraints{ make in
            make.width.equalTo(400)
            make.centerX.equalToSuperview()
            make.top.equalTo(containerView.snp.bottom).offset(-40)
          }
    }
}
