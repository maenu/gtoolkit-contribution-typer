Extension { #name : #RBMessageNode }

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtCanType [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtFiltersToTypeWithPragma [
	<typPraResult: 'GtCoderMethodsFilter'>
	^ (TypGtCoderTypeFilter new
		type: self receiver typInfType;
		yourself) & (GtSearchImplementorsFilter selector: self selector)
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtFiltersToTypeWithShadow [

	<typPraResult: 'GtCoderMethodsFilter'>
	| type clazz shadows argumentTypes resultType |
	TypInfSelf value: self typGtSelf during: [ 
		type := self receiver typInfType.
		clazz := (type isNamed and: [ type hasClassDescription ])
			         ifTrue: [ type classDescription ]
			         ifFalse: [ Object ].
		argumentTypes := self numArgs timesCollect: [ :i | 
			                 self typInfMethod argumentAt: i ].
		resultType := self typInfMethod result ].
	shadows := (TypShaShadow typGtShadowFor: clazz)
		           ifEmpty: [ { (TypShaShadow typGtNewShadowFor: clazz) } ]
		           ifNotEmpty: #yourself.
	^ (shadows collect: [ :e | 
		   | method |
		   method := clazz isClassSide
			             ifTrue: [ 
				             e
					             typGtShadowClassInstanceMethod: self selector
					             arguments: argumentTypes
					             result: resultType ]
			             ifFalse: [ 
				             e
					             typGtShadowInstanceMethod: self selector
					             arguments: argumentTypes
					             result: resultType ].
		   ^ (GtSearchImplementorsFilter selector: method selector)
		     & (TypGtCoderTypeFilter new
				      type: method methodClass typAsType;
				      yourself) ]) reduce: [ :a :b | a | b ]
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtInvokedMethods [

	| methods receiverType |
	methods := super typGtInvokedMethods.
	receiverType := receiver typInfType.
	(receiverType isNamed and: [ receiverType hasClassDescription ]) 
		ifTrue: [ 
			receiverType classDescription
				classAndMethodFor: selector value
				do: [ :c :m | ^ methods , { m } ]
				ifAbsent: [  ] ].
	^ methods
]
