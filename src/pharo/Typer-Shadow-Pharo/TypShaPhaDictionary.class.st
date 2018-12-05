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
TypShaPhaDictionary >> _anyOne [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 2 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> _asOrderedDictionary [
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
TypShaPhaDictionary >> _associations [
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
TypShaPhaDictionary >> _associationsDo: _a [
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
TypShaPhaDictionary >> _at: _a ifAbsentPut: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ a receiverType parameters at: 1 ]
				ifFalse: [ BlockClosure typAsType asParametricType: {(a receiverType parameters at: 2)} ] ];
		resultType: [ :a | a receiverType parameters at: 2 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> _at: _a put: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: i ];
		resultType: [ :a | a receiverType parameters at: 2 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> _includes: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: 2 ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> _includesKey: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: 1 ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaDictionary >> _keys [
	TypMethodResolver new
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
