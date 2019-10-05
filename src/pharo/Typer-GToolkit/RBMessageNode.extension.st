Extension { #name : #RBMessageNode }

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtCanType [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtFiltersToTypeWithPragma [
	<typTypeResultAs: 'GtCoderMethodsFilter'>
	^ (TypGtCoderTypeFilter new
		type: self receiver typType;
		yourself) & (GtSearchImplementorsFilter selector: self selector)
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtFiltersToTypeWithShadow [
	<typTypeResultAs: 'GtCoderMethodsFilter'>
	| type clazz shadows argumentTypes resultType |
	type := self receiver typType.
	clazz := (type isNamed and: [ type hasClassDescription ])
		ifTrue: [ type classDescription ]
		ifFalse: [ Object ].
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
