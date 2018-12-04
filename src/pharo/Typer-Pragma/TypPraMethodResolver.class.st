Class {
	#name : #TypPraMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma-Core'
}

{ #category : #accessing }
TypPraMethodResolver >> resolverFor: aLookup [
	| clazz method argumentPragmas resultPragma "typCastAs !Pragma" argumentTypes "typParameters TypType" resultType "typCastAs TypType" |
	self assert: [ self resolves: aLookup ].
	clazz := aLookup receiverType asClass.
	method := clazz methods detect: [ :e | e selector = aLookup selector ].
	argumentPragmas := method pragmas select: [ :e | e selector = #typTypeArgument:as: ].
	resultPragma := method pragmas detect: [ :e | e selector = #typTypeResultAs: ] ifNone: [ nil ].
	argumentTypes := method numArgs
		timesCollect: [ :i | 
			argumentPragmas
				detect: [ :e | (e arguments at: 1) = i ]
				ifFound: [ :e | (e arguments at: 2) typAsType ]
				ifNone: [ TypUnknownType instance ] ].
	resultType := resultPragma
		ifNil: [ TypUnknownType instance ]
		ifNotNil: [ resultPragma arguments first typAsType ].
	^ TypMethodResolver new
		receiverType: clazz typAsType;
		selector: method selector;
		argumentTypes: [ :i | argumentTypes at: i ];
		resultType: [ resultType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypPraMethodResolver >> resolves: aLookup [
	| clazz |
	aLookup receiverType hasClass
		ifFalse: [ ^ false ].
	clazz := aLookup receiverType asClass.
	^ clazz methods
		anySatisfy:
			[ :e | e selector = aLookup selector and: [ e pragmas anySatisfy: [ :f | f selector = #typTypeArgument:as: or: [ f selector = #typTypeResultAs: ] ] ] ]
]
