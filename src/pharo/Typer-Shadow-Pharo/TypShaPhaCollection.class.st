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
TypShaPhaCollection >> ___anyOne [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___anySatisfy: _a [
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
TypShaPhaCollection >> ___asSet [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | Set typAsType asParametricType: {(a receiverType parameters at: 1)} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___collect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					TypUnknownType instance} ];
		resultType: [ :a | 
			| argument elementType |
			argument := a argumentTypes at: 1.
			elementType := (argument hasClass and: [ (argument asClass includesBehavior: BlockClosure) and: [ argument isParametric ] ])
				ifTrue: [ argument parameters last ]
				ifFalse: [ TypUnknownType instance ].
			a receiverType asParametricType: {elementType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___detect: _a [
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
TypShaPhaCollection >> ___detect: _a ifFound: _b ifNone: _c [
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
TypShaPhaCollection >> ___detect: _a ifNone: _b [
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
TypShaPhaCollection >> ___do: _a [
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
TypShaPhaCollection >> ___flatCollect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					TypUnknownType instance} ];
		resultType: [ :a | 
			| argument elementType |
			argument := a argumentTypes at: 1.
			elementType := (argument hasClass
				and: [ (argument asClass includesBehavior: BlockClosure) and: [ argument isParametric and: [ argument parameters last isParametric ] ] ])
				ifTrue: [ argument parameters last parameters at: 1 ]
				ifFalse: [ TypUnknownType instance ].
			a receiverType asParametricType: {elementType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaCollection >> ___groupedBy: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					TypUnknownType instance} ];
		resultType: [ :a :s :r | 
			Dictionary typAsType
				asParametricType:
					{(a argumentTypes at: 1) parameters last.
					(Collection typAsType
						asParametricType: {(a receiverType parameters at: 1)})} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___includes: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | a receiverType parameters at: 1 ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___inject: _a into: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ a argumentTypes at: 1 ]
				ifFalse: [ BlockClosure typAsType
						asParametricType:
							{(a argumentTypes at: 1).
							(a receiverType parameters at: 1)} ] ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___max [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Number typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___reject: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asParametricType:
					{(a receiverType parameters at: 1).
					Boolean typAsType} ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___select: _a [
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
TypShaPhaCollection >> ___size [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCollection >> ___sort: _a [
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

{ #category : #accessing }
TypShaPhaCollection >> ~~~, _a [
	^ TypMethodResolver new
		argumentTypes:
				[ :i :a :s :r | Collection typAsType asParametricType: a receiverType parameters ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
