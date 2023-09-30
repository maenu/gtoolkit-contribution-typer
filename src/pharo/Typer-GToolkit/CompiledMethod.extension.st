Extension { #name : #CompiledMethod }

{ #category : #'*Typer-GToolkit' }
CompiledMethod >> typGtCheElement [
	^ BlElement new
		in: [ :e | e background: self ast typGtCheColor ];
		constraintsDo: [ :c | 
			c horizontal exact: 16.
			c vertical exact: 16 ];
		aptitude: (BrGlamorousWithTooltipAptitude
				content: [ BrLabel new
						aptitude: BrGlamorousLabelAptitude;
						padding: (BlInsets all: 5);
						text: self selector;
						yourself ]);
		when: BlClickEvent
			do: [ :f | 
				f consumed: true.
				f target phlow spawnObject: self ];
		yourself
]
