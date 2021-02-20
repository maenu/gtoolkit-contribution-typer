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
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {Behavior typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___basicNew [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			(a receiverType asCollection
				collect: [ :e | 
					e isUnknown
						ifTrue: [ e ]
						ifFalse: [ e classDescription instanceSide typAsType ] ])
				typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___canUnderstand: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___classVarNames [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Set typAsType copyWithParameters: {String typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___compile: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___compiledMethodAt: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___includesBehavior: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Behavior typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___includesSelector: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___inheritsFrom: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | ClassDescription typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___instVarNames [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {String typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___isAbstract [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBehavior >> ___lookupSelector: _a [
	^ TypFunctionType new
		argumentTypes: [ Symbol typAsType ];
		resultType: [ CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___methodNamed: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___methods [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ Collection typAsType copyWithParameters: {CompiledMethod typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___name [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___new [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			(a receiverType asCollection
				collect: [ :e | 
					e isUnknown
						ifTrue: [ e ]
						ifFalse: [ e classDescription instanceSide typAsType ] ])
				typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___selectors [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType copyWithParameters: {Symbol typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___superclass [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___whichClassDefinesClassVar: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Class typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___whichClassDefinesInstVar: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ___withAllSuperclasses [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {ClassDescription typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaBehavior >> ~~~>> _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]
