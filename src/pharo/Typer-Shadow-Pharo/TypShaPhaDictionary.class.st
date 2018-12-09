Class {
	#name : #TypShaPhaDictionary,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaDictionary class >> shadowedClass [
	^ Dictionary class
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___anyOne [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 2 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___asOrderedDictionary [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			OrderedDictionary typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					(a receiverType parameters at: 2)} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___associations [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | 
			Collection typAsType
				asParametricType:
					{(Association typAsType
						asParametricType:
							{(a receiverType parameters at: 1).
							(a receiverType parameters at: 2)})} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___associationsDo: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(Association typAsType
						asParametricType:
							{(a receiverType parameters at: 1).
							(a receiverType parameters at: 2)}).
					TypUnknownType instance} ];
		resultType: [ :a :s | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___at: _a ifAbsentPut: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ a receiverType parameters at: 1 ]
				ifFalse: [ BlockClosure typAsType asParametricType: {(a receiverType parameters at: 2)} ] ];
		resultType: [ :a | a receiverType parameters at: 2 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___at: _a put: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType parameters at: 2 ];
		yourself
]

{ #category : #accessing }
TypShaPhaDictionary >> ___collect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: 2).
					TypUnknownType instance} ];
		resultType: [ :a :s :r | 
			| argument elementType |
			argument := a argumentTypes at: 1.
			elementType := (argument hasClass and: [ (argument asClass includesBehavior: BlockClosure) and: [ argument isParametric ] ])
				ifTrue: [ argument parameters at: 1 ]
				ifFalse: [ TypUnknownType instance ].
			a receiverType asParametricType: {elementType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___includes: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: 2 ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___includesKey: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: 1 ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> ___keys [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | Collection typAsType asParametricType: {(a receiverType parameters at: 1)} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> asType: aClass [
	^ aClass typAsNamedType
		asParametricType:
			{TypUnknownType instance.
			TypUnknownType instance}
]
