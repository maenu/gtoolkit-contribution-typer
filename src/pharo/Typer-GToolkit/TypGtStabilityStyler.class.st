Class {
	#name : #TypGtStabilityStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtStabilityStyler >> visitMethodNode: aNode [
	| position color |
	context == context home ifFalse: [ ^ self ].
	position := aNode arguments
			ifEmpty: [ aNode keywordsIntervals last stop ]
			ifNotEmpty: [ :c | c last stop ].
	color := context isStable
			ifTrue: BrGlamorousColors successBackgroundColor
			ifFalse: BrGlamorousColors errorBackgroundColor.
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
							background: color;
							geometry: BlEllipseGeometry new;
							when: BlClickEvent do: [ :e | e target phlow spawnObject: context ];
							yourself ];
					yourself}
		from: position
		to: position
]
