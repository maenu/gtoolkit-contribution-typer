Extension { #name : #ClassDescription }

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtMethodsElementInPackage: aPackage [
	| methods width |
	methods := aPackage methodsForClass: self.
	width := methods size sqrt ceiling.
	^ BlElement new
		layout:
			(BlGridLayout new
				rowCount: width;
				columnCount: width;
				cellSpacing: 5;
				yourself);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1);
		viewModel:
			(BrTooltipModel new
				stencil: [ BrLabel new
						look: BrGlamorousLabelLook;
						padding: (BlInsets all: 5);
						text: self name;
						yourself ];
				yourself)
				+
					(BrInteractiveModel new
						addState: BrHoverModel new;
						yourself);
		look: BrGlamorousWithTooltipLook;
		addChildren: (methods collect: #typGtElement);
		yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtVariableElementFor: aSymbol [
	| type |
	type := TypVariableLookupIndex instance
		typeFor:
			(TypVariableLookup new
				receiverType: self typAsType;
				selector: aSymbol;
				yourself).
	^ BlElement new
		background:
			(type isUnknown
				ifTrue: [ Color blue ]
				ifFalse: [ Color green ]);
		constraintsDo: [ :c | 
			c horizontal exact: 16.	"typCastAs BlLayoutCommonConstraintsAxis"
			c vertical exact: 16	"typCastAs BlLayoutCommonConstraintsAxis" ];
		viewModel:
			(BrTooltipModel new
				stencil: [ BrLabel new
						look: BrGlamorousLabelLook;
						padding: (BlInsets all: 5);
						text: aSymbol;
						yourself ];
				yourself)
				+
					(BrInteractiveModel new
						addState: BrHoverModel new;
						yourself);
		look: BrGlamorousWithTooltipLook;
		when: BlClickEvent do: [ :f | f target phlow spawnObject: type ];
		yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtVariableNames [
	^ self instVarNames
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtVariablesElementInPackage: aPackage [
	| variables width |
	variables := (aPackage includesClass: self instanceSide)
		ifTrue: [ self typGtVariableNames ]
		ifFalse: [ #() ].
	width := variables size sqrt ceiling.
	^ BlElement new
		layout:
			(BlGridLayout new
				rowCount: width;
				columnCount: width;
				cellSpacing: 5;
				yourself);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1);
		viewModel:
			(BrTooltipModel new
				stencil: [ BrLabel new
						look: BrGlamorousLabelLook;
						padding: (BlInsets all: 5);
						text: self name;
						yourself ];
				yourself)
				+
					(BrInteractiveModel new
						addState: BrHoverModel new;
						yourself);
		look: BrGlamorousWithTooltipLook;
		addChildren: (variables collect: [ :e | self typGtVariableElementFor: e ]);
		yourself
]
