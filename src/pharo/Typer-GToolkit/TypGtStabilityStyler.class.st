Class {
	#name : #TypGtStabilityStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtStabilityStyler >> visitMethodNode: aNode [
	| position |
	position := aNode arguments
			ifEmpty: [ aNode keywordsIntervals last stop ]
			ifNotEmpty: [ :c | c last stop ].
	self
		attributes: {BrTextAdornmentDynamicAttribute new
					beAppend;
					stencil: [ BlElement new
							aptitude: (BrGlamorousWithTooltipAptitude
									content: [ BrLabel new
											aptitude: BrGlamorousLabelAptitude;
											text: (self context isStable ifTrue: 'stable' ifFalse: 'not stable');
											yourself ]);
							margin: (BlInsets
									top: 0
									right: 0
									bottom: 0
									left: 3);
							size: 8 @ 8;
							background: (self context isStable
									ifTrue: BrGlamorousColors successBackgroundColor
									ifFalse: BrGlamorousColors errorBackgroundColor);
							geometry: BlEllipseGeometry new;
							when: BlClickEvent do: [ :e | e target phlow spawnObject: self context ];
							yourself ];
					yourself}
		from: position
		to: position
]
