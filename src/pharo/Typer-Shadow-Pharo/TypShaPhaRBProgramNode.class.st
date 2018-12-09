Class {
	#name : #TypShaPhaRBProgramNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode class >> shadowedClass [
	^ RBProgramNode class
]

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode >> ___assignmentNodes [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType asParametricType: {RBAssignmentNode typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode >> ___comments [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType asParametricType: {RBComment typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode >> ___methodNode [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ RBMethodNode typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___propertyAt: _a ifAbsentPut: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ BlockClosure typAsType
						asParametricType:
							{Object typAsType.
							TypUnknownType instance} ] ];
		resultType: [ :a :s :r | 
			{TypUnknownType instance.
			(a argumentTypes at: 2) parameters last} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___propertyAt: _a ifPresent: _b ifAbsent: _c [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ BlockClosure typAsType
								asParametricType:
									{Object typAsType.
									TypUnknownType instance} ]
						ifFalse: [ BlockClosure typAsType
								asParametricType:
									{Object typAsType.
									TypUnknownType instance} ] ] ];
		resultType: [ :a :s :r | 
			{(a argumentTypes at: 2) parameters last.
			(a argumentTypes at: 3) parameters last} typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode >> ___whoDefines: _a [
	^ TypMethodResolver new
		argumentTypes: [ String typAsType ];
		resultType: [ RBProgramNode typAsType copy
				nullable: true;
				yourself ];
		yourself
]
