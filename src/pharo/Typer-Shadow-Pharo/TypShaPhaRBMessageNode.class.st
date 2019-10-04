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
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithBindings: {('@A' -> RBValueNode typAsType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMessageNode >> ___keywordsIntervals [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithBindings:
					{('@A'
						->
							(Interval typAsType
								copyWithBindings: {('@A' -> Integer typAsType)} asOrderedDictionary))}
						asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMessageNode >> ___numArgs [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMessageNode >> ___receiver [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBValueNode typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMessageNode >> ___selector [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]
