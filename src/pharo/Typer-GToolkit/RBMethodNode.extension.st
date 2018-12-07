Extension { #name : #RBMethodNode }

{ #category : #'*Typer-GToolkit' }
RBMethodNode >> typGtCanType [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBMethodNode >> typGtFiltersToTypeWithShadow [
	| clazz shadows shadow argumentTypes resultType method |
	clazz := self methodClass.
	shadows := TypShaShadow shadowClassesFor: clazz.
	shadows size > 1
		ifTrue: [ ^ shadows ].
	shadow := shadows isEmpty
		ifTrue: [ TypShaShadow typGtNewShadowFor: clazz ]
		ifFalse: [ shadows anyOne ].
	argumentTypes := self numArgs timesCollect: [ :i | self typTypeForArgumentAt: i ].
	resultType := self typTypeForResult.
	method := clazz isClassSide
		ifTrue: [ shadow typGtShadowClassInstanceMethod: self selector arguments: argumentTypes result: resultType ]
		ifFalse: [ shadow typGtShadowInstanceMethod: self selector arguments: argumentTypes result: resultType ].
	^ (TypGtCoderTypeFilter new
		type: method methodClass typAsType;
		yourself) & (GtCoderImplementorsFilter selector: method selector)
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
							(RBLiteralValueNode value: (self typTypeForArgumentAt: i) asSourceString)} ] ].
	result_ := self pragmas
		detect: [ :e | e selector = #typTypeResultAs: ]
		ifFound: [ :e | 
			self removePragma: e.
			e ]
		ifNone: [ RBPragmaNode selector: #typTypeResultAs: arguments: {(RBLiteralValueNode value: self typTypeForResult asSourceString)} ].
	variables_ := {}.
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
									(RBLiteralValueNode value: (self methodClass typTypeForVariable: e) asSourceString)} ] ] ].
	arguments_ do: [ :e | self addPragma: e ].
	self addPragma: result_.
	variables_ do: [ :e | self addPragma: e ].
	^ self
]
