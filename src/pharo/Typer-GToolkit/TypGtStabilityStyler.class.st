Class {
	#name : #TypGtStabilityStyler,
	#superclass : #TypGtRbAstWithContextStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtStabilityStyler >> visitMethodNode: aNode [
	| position context |
	context := coderViewModel typGtContext.
	context sender ifNotNil: [ ^ self ].
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
											text: (context isStable ifTrue: 'stable' ifFalse: 'not stable');
											yourself ]);
							margin: (BlInsets
									top: 0
									right: 0
									bottom: 0
									left: 3);
							size: 8 @ 8;
							background: (context isStable
									ifTrue: BrGlamorousColors successBackgroundColor
									ifFalse: BrGlamorousColors errorBackgroundColor);
							geometry: BlEllipseGeometry new;
							when: BlClickEvent do: [ :e | e target phlow spawnObject: context ];
							yourself ];
					yourself}
		from: position
		to: position
]
