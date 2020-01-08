Extension { #name : #RBMethodNode }

{ #category : #'*Typer-GToolkit' }
RBMethodNode >> typGtCanType [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBMethodNode >> typGtFiltersToTypeWithShadow [
	<typTypeResultAs: 'GtCoderMethodsFilter'>
	| clazz shadows argumentTypes resultType |
	clazz := self methodClass.
	argumentTypes := self numArgs
		timesCollect: [ :i | self typTypeForArgumentAt: i ].
	resultType := self typTypeForResult.
	shadows := (TypShaShadow typGtShadowFor: clazz)
		ifEmpty: [ {(TypShaShadow typGtNewShadowFor: clazz)} ]
		ifNotEmpty: #yourself.
	^ (shadows
		collect: [ :e | 
			| method |
			method := clazz isClassSide
				ifTrue: [ e
						typGtShadowClassInstanceMethod: self selector
						arguments: argumentTypes
						result: resultType ]
				ifFalse: [ e
						typGtShadowInstanceMethod: self selector
						arguments: argumentTypes
						result: resultType ].
			^ (TypGtCoderTypeFilter new
				type: method methodClass typAsType;
				yourself) & (GtSearchImplementorsFilter selector: method selector) ])
		reduce: [ :a :b | a | b ]
]

{ #category : #'*Typer-GToolkit' }
RBMethodNode >> typGtTypeWithPragma [
	| arguments_ result_ variables_ |
	arguments_ := self numArgs
		timesCollect: [ :i | 
			self pragmas
				detect: [ :e | e selector = #typTypeArgument:as: ]
				ifFound: [ :e | 
					self removePragma: e.
					e ]
				ifNone: [ RBPragmaNode
						selector: #typTypeArgument:as:
						arguments:
							{(RBLiteralValueNode value: i).
							(RBLiteralValueNode value: (self typTypeForArgumentAt: i) asString)} ] ].
	result_ := self pragmas
		detect: [ :e | e selector = #typTypeResultAs: ]
		ifFound: [ :e | 
			self removePragma: e.
			e ]
		ifNone: [ RBPragmaNode selector: #typTypeResultAs: arguments: {(RBLiteralValueNode value: self typTypeForResult asString)} ].
	variables_ := {} "typCastAs SequenceableCollection<RBPragmaNode>".
	self selector = #initialize
		ifTrue: [ variables_ := self methodClass instVarNames
				collect: [ :e | 
					self pragmas
						detect: [ :f | f selector = #typTypeVariable:as: ]
						ifFound: [ :f | 
							self removePragma: f.
							f ]
						ifNone: [ RBPragmaNode
								selector: #typTypeVariable:as:
								arguments:
									{(RBLiteralValueNode value: e asString).
									(RBLiteralValueNode value: (self typContext selfType typeForVariable: e asSymbol) asString)} ] ] ].
	arguments_ do: [ :e | self addPragma: e ].
	self addPragma: result_.
	variables_ do: [ :e | self addPragma: e ]
]
