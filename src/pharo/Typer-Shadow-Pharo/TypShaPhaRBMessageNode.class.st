Class {
	#name : #TypShaPhaRBMessageNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBMessageNode class >> shadowedClass [
	^ RBMessageNode class
]

{ #category : #'as yet unclassified' }
TypShaPhaRBMessageNode >> ___arguments [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithParameters: {RBValueNode typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMessageNode >> ___keywordsIntervals [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {(Interval typAsType copyWithParameters: {Integer typAsType})} ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMessageNode >> ___numArgs [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMessageNode >> ___receiver [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBValueNode typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMessageNode >> ___selector [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]
