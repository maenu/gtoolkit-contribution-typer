Class {
	#name : #TypPraMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma-Core'
}

{ #category : #initialization }
TypPraMethodResolver >> initialize [
	<typTypeParametersAs: 'TypMethodLookup'>
	super initialize
]

{ #category : #accessing }
TypPraMethodResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypMethodResolver<TypMethodLookup>>'>
	| clazz method argumentPragmas resultPragma signalsAlwaysPragma argumentTypes resultType signalsAlways |
	self assert: [ self resolves: aLookup ].
	clazz := aLookup receiverType asClass.
	method := clazz methods
		detect: [ :e | e selector = aLookup selector ].
	argumentPragmas := method pragmas
		select: [ :e | e selector = #typTypeArgument:as: ].
	resultPragma := method pragmas
		detect: [ :e | e selector = #typTypeResultAs: ]
		ifNone: [ nil ].
	signalsAlwaysPragma := method pragmas
		detect: [ :e | e selector = #typSignalsAlways: ]
		ifNone: [ nil ].
	argumentTypes := method numArgs
		timesCollect: [ :i | 
			argumentPragmas
				detect: [ :e | (e arguments at: 1) = i ]
				ifFound: [ :e | ((e arguments at: 2) "typCastAs String<Character>") typAsType ]
				ifNone: [ TypUnknownType instance ] ].
	resultType := resultPragma
		ifNil: [ TypUnknownType instance ]
		ifNotNil: [ (resultPragma arguments first "typCastAs String<Character>") typAsType ].
	signalsAlways := signalsAlwaysPragma
		ifNil: [ nil ]
		ifNotNil: [ signalsAlwaysPragma arguments first "typCastAs Boolean" ].
	^ {(TypMethodResolver new
		argumentTypes: [ :i | argumentTypes at: i ];
		resultType: [ resultType ];
		signalsAlways: [ signalsAlways ];
		yourself)}
]

{ #category : #accessing }
TypPraMethodResolver >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'Boolean'>
	| clazz |
	aLookup receiverType representsClass
		ifFalse: [ ^ false ].
	clazz := aLookup receiverType asClass.
	^ clazz methods
		anySatisfy: [ :e | 
			e selector = aLookup selector
				and: [ e pragmas
						anySatisfy: [ :f | 
							f selector = #typTypeArgument:as:
								or: [ f selector = #typTypeResultAs:
										or: [ f selector = #typSignalsAlways: ] ] ] ] ]
]
