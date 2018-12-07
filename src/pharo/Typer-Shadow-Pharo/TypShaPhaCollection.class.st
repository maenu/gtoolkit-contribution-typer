Class {
	#name : #TypShaPhaCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaCollection class >> shadowedClass [
	^ Collection class
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _anyOne [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _anySatisfy: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					Boolean typAsType} ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _asSet [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | Set typAsType asParametricType: {(a receiverType parameters at: 1)} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _collect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					TypUnknownType instance} ];
		resultType: [ :a | 
			| resultType |
			resultType := a argumentTypes
				inject: TypUnionType new
				into: [ :e :f | 
					e
						increment:
							(f isParametric
								ifTrue: [ f parameters last	"typCastAs TypParametricType" ]
								ifFalse: [ TypUnknownType instance ]).
					e ].
			a receiverType asParametricType: {resultType asType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _detect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					Boolean typAsType} ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _detect: _a ifFound: _b ifNone: _c [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ BlockClosure typAsType
						asParametricType:
							{(a receiverType parameters at: 1).
							Boolean typAsType} ]
				ifFalse: [ BlockClosure typAsType
						asParametricType:
							{(a receiverType parameters at: 1).
							TypUnknownType instance} ] ];
		resultType: [ :a | 
			{(a argumentTypes at: 2) parameters last.
			(a argumentTypes at: 3) parameters last} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _detect: _a ifNone: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ BlockClosure typAsType
						asParametricType:
							{(a receiverType parameters at: 1).
							Boolean typAsType} ]
				ifFalse: [ BlockClosure typAsType
						asParametricType:
							{(a receiverType parameters at: 1).
							TypUnknownType instance} ] ];
		resultType: [ :a | 
			{(a receiverType parameters at: 1).
			(a argumentTypes at: 2) parameters last} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _do: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: i).
					a receiverType} ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #enumerating }
TypShaPhaCollection >> _flatCollect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					(Collection typAsType
						asParametricType:
							{((a argumentTypes at: 1) isParametric
								ifTrue: [ (a argumentTypes at: 1) parameters at: 1 ]
								ifFalse: [ TypUnknownType instance ])})} ];
		resultType: [ :a | 
			a receiverType
				asParametricType:
					{((a argumentTypes at: 1) isParametric
						ifTrue: [ (a argumentTypes at: 1) parameters at: 1 ]
						ifFalse: [ TypUnknownType instance ])} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _includes: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: 1 ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _inject: _a into: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			i = 1
				ifTrue: [ a argumentTypes at: 1 ]
				ifFalse: [ BlockClosure typAsType
						asParametricType:
							{(a argumentTypes at: 1).
							(a receiverType parameters at: 1).
							(a argumentTypes at: 1)} ] ];
		resultType: [ :a | a argumentTypes at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _max [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Number typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _select: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					Boolean typAsType} ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _size [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> _sort: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					(a receiverType parameters at: 1).
					Boolean typAsType} ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> asType: aClass [
	^ aClass typAsNamedType asParametricType: {TypUnknownType instance}
]
