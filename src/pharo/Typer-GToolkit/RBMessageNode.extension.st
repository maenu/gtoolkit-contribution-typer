Extension { #name : #RBMessageNode }

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtCanType [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtFiltersToTypeWithPragma [
	^ (TypGtCoderTypeFilter new
		type: self receiver typType;
		yourself) & (GtCoderImplementorsFilter selector: self selector)
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtFiltersToTypeWithShadow [
	| type clazz shadows shadow argumentTypes resultType method |
	type := self receiver typType.
	clazz := type hasClass
		ifTrue: [ type asClass ]
		ifFalse: [ Object ].
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
