Class {
	#name : #TypShaPhaClassDescription,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #accessing }
TypShaPhaClassDescription class >> ___allSubclasses [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {ClassDescription typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaClassDescription class >> shadowedClass [
	^ ClassDescription class
]

{ #category : #accessing }
TypShaPhaClassDescription >> ___classSide [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Metaclass typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaClassDescription >> ___instanceSide [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Class typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaClassDescription >> ___lookupSelector: _a [
	^ TypMethodResolver new
		argumentTypes: [ Symbol typAsType ];
		resultType: [ CompiledMethod typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaClassDescription >> ___methods [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Collection typAsType asParametricType: {CompiledMethod typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaClassDescription >> ___whichClassDefinesInstVar: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaClassDescription >> ___withAllSuperclasses [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | SequenceableCollection typAsType asParametricType: {ClassDescription typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaClassDescription >> ~~~-> _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | a argumentTypes at: 1 ];
		resultType: [ :a :s :r | 
			Association typAsType
				asParametricType:
					{a receiverType.
					(a argumentTypes at: 1)} ];
		yourself
]
