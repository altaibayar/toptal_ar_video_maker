//
//  RecordButton.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 14/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit

protocol RecordButtonDelegate: class {
    func recordButtonTouchBegan(for button: RecordButton);
    func recordButtonTouchEnd(for button: RecordButton);
}

class RecordButton: UIButton {

    weak var delegate: RecordButtonDelegate?

    override var isHighlighted: Bool {
        didSet {
            if oldValue != self.isHighlighted {
                self.highlightChanged();
            }
        }
    }

    lazy var arcLayer: CAShapeLayer = {
        let result = CAShapeLayer();
        result.strokeStart = 0.0;
        result.strokeEnd = 0.0;
        result.fillColor = UIColor.clear.cgColor;
        result.strokeColor = UIColor.toptalRed.cgColor;
        result.lineWidth = 8.0;
        result.lineCap = kCALineCapRound;

        return result;
    }();

    lazy var rotationAnimation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z");
        animation.toValue = Float.pi * 2;
        animation.isCumulative = true;
        animation.duration = 2.0;
        animation.repeatCount = Float.infinity;

        return animation;
    }();

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);

        self.setTitle(nil, for: .normal);
        self.backgroundColor = UIColor.toptalRed.withAlphaComponent(0.4);
        self.layer.addSublayer(self.arcLayer);
    }

    override func layoutSubviews() {
        super.layoutSubviews();

        self.layer.masksToBounds = true;
        self.layer.cornerRadius = self.frame.height / 2.0;

        self.arcLayer.frame = self.bounds;
        self.arcLayer.path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                                          radius: (bounds.width / 2.0) - (8.0 / 2),
                                          startAngle: -CGFloat.pi / 2.0,
                                          endAngle: 2 * CGFloat.pi,
                                          clockwise: true).cgPath;
    }

    private func highlightChanged() {

        if self.isHighlighted {
            self.startAnimation();
            self.delegate?.recordButtonTouchBegan(for: self);
        } else {
            self.stopAnimation();
            self.delegate?.recordButtonTouchEnd(for: self);
        }
    }
}

private extension RecordButton {

    private func startAnimation() {
        print("animation starting");

        UIView.animate(withDuration: 0.3) {
            self.arcLayer.strokeEnd = 0.5;
        }
        self.arcLayer.add(self.rotationAnimation, forKey: "rotationAnimation");
    }

    private func stopAnimation() {
        print("animation ending");

        UIView.animate(withDuration: 0.3) {
            self.arcLayer.strokeEnd = 0.0;
        }
        self.arcLayer.add(self.rotationAnimation, forKey: "rotationAnimation");
    }
}
