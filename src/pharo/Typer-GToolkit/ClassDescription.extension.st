Extension { #name : #ClassDescription }

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtCoverageFor: aView context: aDictionary [
	<gtClassView>
	^ aView explicit
		title: 'Coverage';
		priority: 50;
		stencil: [ BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChildren:
					{(BrLabel new
						look: BrGlamorousLabelLook;
						text: 'methods';
						yourself).
					self typGtMethodCoverage typGtAsCoverageElement.
					(BrLabel new
						look: BrGlamorousLabelLook;
						text: 'nodes';
						yourself).
					self typGtNodeCoverage typGtAsCoverageElement};
				yourself ];
		yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtMethodCoverage [
	^ self methods , self classSide methods
		groupedBy: [ :e | 
			ASTCache default
				at: e
				ifPresent: [ :f | f propertyAt: #tagExecuted ifAbsent: [ nil ] ]
				ifAbsent: [ nil ] ]
]

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
		look:
			(BrGlamorousWithTooltipLook
				content: [ BrLabel new
						look: BrGlamorousLabelLook;
						padding: (BlInsets all: 5);
						text: self name;
						yourself ]);
		addChildren: (methods collect: #typGtElement);
		yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtNodeCoverage [
	^ (self methods , self classSide methods
		flatCollect: [ :e | e ast allChildren , {e ast} ])
		groupedBy: [ :e | e propertyAt: #tagExecuted ifAbsent: [ nil ] ]
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
		look:
			(BrGlamorousWithTooltipLook
				content: [ BrLabel new
						look: BrGlamorousLabelLook;
						padding: (BlInsets all: 5);
						text: aSymbol;
						yourself ]);
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
		look:
			(BrGlamorousWithTooltipLook
				content: [ BrLabel new
						look: BrGlamorousLabelLook;
						padding: (BlInsets all: 5);
						text: self name;
						yourself ]);
		addChildren: (variables collect: [ :e | self typGtVariableElementFor: e ]);
		yourself
]
