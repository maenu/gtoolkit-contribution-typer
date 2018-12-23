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
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | SequenceableCollection typAsType asParametricType: {Behavior typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___classVarNames [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Set typAsType asParametricType: {String typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___compiledMethodAt: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___inheritsFrom: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | ClassDescription typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___instVarNames [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | SequenceableCollection typAsType asParametricType: {String typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBehavior >> ___lookupSelector: _a [
	^ TypMethodResolver new
		argumentTypes: [ Symbol typAsType ];
		resultType: [ CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___methodNamed: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___methods [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Collection typAsType asParametricType: {CompiledMethod typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___name [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___new [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___selectors [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType asParametricType: {Symbol typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___superclass [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___whichClassDefinesClassVar: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Class typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___whichClassDefinesInstVar: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___withAllSuperclasses [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | SequenceableCollection typAsType asParametricType: {ClassDescription typAsType} ];
		yourself
]
