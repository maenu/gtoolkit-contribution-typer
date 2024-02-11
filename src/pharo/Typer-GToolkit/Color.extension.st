Extension { #name : #Color }

{ #category : #'*Typer-GToolkit' }
Color >> typGtMix: d with: aColor [
	self assert: [ d between: 0 and: 1 ].
	^ Color
		r: (1 - d) * self red + (d * aColor red)
		g: (1 - d) * self green + (d * aColor green)
		b: (1 - d) * self blue + (d * aColor blue)
]
