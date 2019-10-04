Class {
	#name : #TypShaPhaBehavior,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBehavior class >> shadowedClass [
	^ Behavior class
]

{ #category : #accessing }
TypShaPhaBehavior >> ___allSubclasses [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithBindings: {('@A' -> Behavior typAsType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___classVarNames [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			Set typAsType
				copyWithBindings: {('@A' -> String typAsType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___compile: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___compiledMethodAt: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___includesBehavior: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Behavior typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___includesSelector: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___inheritsFrom: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | ClassDescription typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___instVarNames [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithBindings: {('@A' -> String typAsType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___isAbstract [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBehavior >> ___lookupSelector: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ Symbol typAsType ];
		resultType: [ CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___methodNamed: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___methods [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Collection typAsType
				copyWithBindings: {('@A' -> CompiledMethod typAsType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___name [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___new [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___selectors [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A' -> Symbol typAsType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___superclass [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___whichClassDefinesClassVar: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Class typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___whichClassDefinesInstVar: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___withAllSuperclasses [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithBindings: {('@A' -> ClassDescription typAsType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ~~~>> _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]
