//
//  TeamTableViewCell.swift
//  FootballChants
//
//  Created by ByteDance on 23/5/25.
//

import UIKit

protocol TeamTableViewCellDelegate: AnyObject {
    func didTapPlayback(for team: Team)
}

class TeamTableViewCell: UITableViewCell {
    
    static let cellId = "TeamTableViewCell"
    private lazy var nameLbl = makeLabel(fontSize: 18, weight: .bold)
    private lazy var foundedLbl = makeLabel(fontSize: 12, weight: .light)
    private lazy var jobLbl = makeLabel(fontSize: 10, weight: .light)
    private lazy var infoLbl = makeLabel(fontSize: 12, weight: .medium)

    var viewLayoutDone = false
    // using weak so that once the application is done with this application, it will get rid of the delegate and not keep it in memory, saving memory on the device
    private weak var delegate: TeamTableViewCellDelegate?
    private var team: Team?
    
    
    // MARK: - UI
    private lazy var containerVw: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var contentStackVw: UIStackView = {
        let stackVw = UIStackView()
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        // this is the spacing between each line
        stackVw.spacing = 4
        // telling the content stack that the axis is vertical
        stackVw.axis = .vertical
        return stackVw
    }()
    
    private lazy var badgeImgVw: UIImageView = {
        let imgVw = UIImageView()
        imgVw.translatesAutoresizingMaskIntoConstraints = false
        imgVw.contentMode = .scaleAspectFit
        return imgVw
    }()

    private lazy var playbackBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        return btn
    }()
    
    private func makeLabel(fontSize: CGFloat, weight: UIFont.Weight) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        // numberOfLines = 0 means the label can use as many lines as needed to display the full content
        // If set to 1, the label will only show one line and truncate the rest if the content is too long
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: fontSize, weight: weight)
        lbl.textColor = .white
        return lbl
    }
    
    
    
    // MARK: - LifeCycle
    override func layoutSubviews() {
        super.layoutSubviews()
        containerVw.layer.cornerRadius = 12
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegate = nil
//        self.contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func setupViews() {
        self.contentView.addSubview(containerVw)

        // Adds `contentStackVw` (a UIStackView) inside the `containerVw`
        containerVw.addSubview(contentStackVw)
        containerVw.addSubview(badgeImgVw)
        containerVw.addSubview(playbackBtn)

        // Adds the labels as arranged subviews of the vertical stack view
        // The stack view automatically manages their layout vertically with spacing
        contentStackVw.addArrangedSubview(nameLbl)
        contentStackVw.addArrangedSubview(foundedLbl)
        contentStackVw.addArrangedSubview(jobLbl)
        contentStackVw.addArrangedSubview(infoLbl)
        
        // Pins `containerVw` to the edges of the cell’s content view, making it fill the entire cell
        // Pins `contentStackVw` inside `containerVw` with 8 points padding on all sides, providing some spacing inside the container
        NSLayoutConstraint.activate([
            containerVw.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerVw.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerVw.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerVw.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),

            badgeImgVw.heightAnchor.constraint(equalToConstant: 50),
            badgeImgVw.widthAnchor.constraint(equalToConstant: 50),
            badgeImgVw.topAnchor.constraint(equalTo: contentStackVw.topAnchor),
            badgeImgVw.leadingAnchor.constraint(equalTo: containerVw.leadingAnchor, constant: 8),

            contentStackVw.topAnchor.constraint(equalTo: containerVw.topAnchor, constant: 16),
            contentStackVw.bottomAnchor.constraint(equalTo: containerVw.bottomAnchor, constant: -16),
            contentStackVw.leadingAnchor.constraint(equalTo: badgeImgVw.trailingAnchor, constant: 8),
            contentStackVw.trailingAnchor.constraint(equalTo: playbackBtn.leadingAnchor, constant: -8),

            playbackBtn.heightAnchor.constraint(equalToConstant: 44),
            playbackBtn.widthAnchor.constraint(equalToConstant: 44),
            playbackBtn.trailingAnchor.constraint(equalTo: containerVw.trailingAnchor, constant: -8),
            playbackBtn.centerYAnchor.constraint(equalTo: containerVw.centerYAnchor)
        ])
        
        print("Creating a brand new cell")
    }
    
    
    func configure(with item: Team, delegate: TeamTableViewCellDelegate?) {
        
        if !viewLayoutDone {
            setupViews()
            viewLayoutDone = true
        }
        
        self.delegate = delegate
        self.team = item
        playbackBtn.addTarget(self, action: #selector(didTapPlayback), for: .touchUpInside)
        containerVw.backgroundColor = item.id.background
        badgeImgVw.image = item.id.badge
        playbackBtn.setImage(item.isPlaying ? Assets.pause : Assets.play, for: .normal)
        nameLbl.text = item.name
        foundedLbl.text = item.founded
        jobLbl.text = "Current manager: \(item.manager.job.rawValue): \(item.manager.name)"
        infoLbl.text = item.info
    }
    
    @objc func didTapPlayback (){
        print("Passing")
        if let team = team {
            delegate?.didTapPlayback(for: team)
        }
    }
}
