Class {
	#name : #TypShaPhaSequenceableCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaSequenceableCollection class >> ___ofSize: _a [
	^ TypMethodResolver new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection class >> shadowedClass [
	^ SequenceableCollection class
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___at: _a [
	^ TypMethodResolver new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___beginsWith: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | a receiverType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___copyFrom: _a to: _b [
	^ TypMethodResolver new
		argumentTypes: [ Integer typAsType ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___detectIndex: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | BlockClosure typAsType asFunctionType: {(a receiverType parameters at: 1)} result: Boolean typAsType optionalParameters: false ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___endsWith: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | a receiverType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___first [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___indexOf: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | a receiverType parameters at: 1 ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___isEmpty [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___last [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaSequenceableCollection >> ___sort: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asFunctionType:
					{(a receiverType parameters at: 1).
					(a receiverType parameters at: 1)}
				result: Boolean typAsType
				optionalParameters: false ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___withIndexCollect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType:
					{(a receiverType parameters at: 1).
					Integer typAsType}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s :r | a receiverType asParametricType: {(a argumentTypes at: 1) result} ];
		yourself
]

{ #category : #enumerating }
TypShaPhaSequenceableCollection >> ___withIndexDo: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a | 
			BlockClosure typAsType
				asFunctionType:
					{(a receiverType parameters at: 1).
					Integer typAsType}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSequenceableCollection >> ___withIndexSelect: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType:
					{(a receiverType parameters at: 1).
					Integer typAsType}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s :r | a receiverType asParametricType: {(a argumentTypes at: 1) result} ];
		yourself
]

{ #category : #converting }
TypShaPhaSequenceableCollection >> asType: aClass [
	^ aClass typAsNamedType asParametricType: {TypUnknownType instance}
]
