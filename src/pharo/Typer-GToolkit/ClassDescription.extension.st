Extension { #name : #ClassDescription }

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtMethodsElementInPackage: aPackage [

	| methods width |
	methods := aPackage methodsForClass: self.
	width := methods size sqrt ceiling.
	^ BlElement new
		  layout: (BlGridLayout new
				   rowCount: width;
				   columnCount: width;
				   cellSpacing: 5;
				   yourself);
		  constraintsDo: [ :c | 
			  c horizontal fitContent.
			  c vertical fitContent ];
		  border:
		  (BlBorder
			   paint: BrGlamorousColors defaultButtonBorderColor
			   width: 1);
		  aptitude: (BrGlamorousWithTooltipAptitude content: [ 
				   BrLabel new
					   aptitude: BrGlamorousLabelAptitude;
					   padding: (BlInsets all: 5);
					   text: self name;
					   yourself ]);
		  addChildren: (methods collect: #typGtElement);
		  yourself
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtShaMethod: aSymbol result: aType arguments: someTypes [
	<typPraArguments: 'Symbol,TypType,SequenceableCollection<TypType>'>
	| methods newSelector |
	methods := self methods select: [ :e | e typShaCanResolveMethod: aSymbol ].
	methods ifNotEmpty: [ ^ methods ].
	newSelector := self typGtShaMethodNewSelector: aSymbol.
	self
		compile: ('{1} aLookup
	<typShaMethod: ''{2}''>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ''{3}'' typAsType
		arguments: \{{4}\}'
				format: {newSelector.
						aSymbol.
						aType.
						' . ' join: (someTypes collect: [ :e | '''{1}'' typAsType' format: {e} ])}).
	^ {self compiledMethodAt: newSelector asSymbol}
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtShaMethodNewSelector: aSymbol [
	| newN newSelector |
	newSelector := self typGtShaMethodSelector: aSymbol postfix: ''.
	newN := 1.
	[ self includesSelector: newSelector ]
		whileTrue: [ newSelector := self typGtShaMethodSelector: aSymbol postfix: newN.
			newN := newN + 1 ].
	^ newSelector
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtShaMethodSelector: aSymbol postfix: anObject [

	aSymbol isUnary ifTrue: [ 
		^ 'm{1}{2}:' format: { 
				  aSymbol capitalized.
				  anObject } ].
	aSymbol isBinary ifTrue: [ ^ 'mBinary{1}:' format: { anObject } ].
	^ 'm{1}{2}:' format: { 
			  ('' join: (aSymbol keywords collect: [ :e | 
					    e capitalized copyFrom: 1 to: e size - 1 ])).
			  anObject }
]

{ #category : #'*Typer-GToolkit' }
ClassDescription >> typGtVariableElementFor: aSymbol [

	| type |
	type := self typAsType lookupVariable: aSymbol.
	^ BlElement new
		  background: (type isUnknown
				   ifTrue: [ Color blue ]
				   ifFalse: [ Color green ]);
		  constraintsDo: [ :c | 
			  c horizontal exact: 16. "typCastAs BlLayoutCommonConstraintsAxis"
			  c vertical exact: 16 "typCastAs BlLayoutCommonConstraintsAxis" ];
		  aptitude: (BrGlamorousWithTooltipAptitude content: [ 
					   BrLabel new
						   aptitude: BrGlamorousLabelAptitude;
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
		             ifFalse: [ #(  ) ].
	width := variables size sqrt ceiling.
	^ BlElement new
		  layout: (BlGridLayout new
				   rowCount: width;
				   columnCount: width;
				   cellSpacing: 5;
				   yourself);
		  constraintsDo: [ :c | 
			  c horizontal fitContent.
			  c vertical fitContent ];
		  border:
		  (BlBorder
			   paint: BrGlamorousColors defaultButtonBorderColor
			   width: 1);
		  aptitude: (BrGlamorousWithTooltipAptitude content: [ 
				   BrLabel new
					   aptitude: BrGlamorousLabelAptitude;
					   padding: (BlInsets all: 5);
					   text: self name;
					   yourself ]);
		  addChildren:
		  (variables collect: [ :e | self typGtVariableElementFor: e ]);
		  yourself
]
