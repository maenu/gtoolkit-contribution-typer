Extension { #name : #CompiledMethod }

{ #category : #'*Typer-GToolkit' }
CompiledMethod >> typGtElement [
	^ BlElement new
		in: [ :e | 
			| color |
			color := self ast
				typType;
				typCheColor.
			(self ast typCheHasUnknownArguments not
				and: [ self ast typCheHasUnknownResult not ])
				ifTrue: [ e background: color ]
				ifFalse: [ e background: color muchLighter ] ];
		constraintsDo: [ :c | 
			c horizontal exact: 16.	"typCastAs BlLayoutCommonConstraintsAxis"
			c vertical exact: 16	"typCastAs BlLayoutCommonConstraintsAxis" ];
		viewModel:
			(BrTooltipModel new
				stencil: [ BrLabel new
						look: BrGlamorousLabelLook;
						padding: (BlInsets all: 5);
						text: self selector;
						yourself ];
				yourself)
				+
					(BrInteractiveModel new
						addState: BrHoverModel new;
						yourself);
		look: BrGlamorousWithTooltipLook;
		when: BlClickEvent do: [ :f | f target phlow spawnObject: self ];
		yourself
]
