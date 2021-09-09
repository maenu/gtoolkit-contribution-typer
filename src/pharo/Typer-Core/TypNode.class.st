Class {
	#name : #TypNode,
	#superclass : #Object,
	#instVars : [
		'dependencies',
		'dependents'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypNode >> addDependency: aDependency [

	self assert: [ aDependency dependency includesDependent: aDependency ].
	self assert: [ aDependency dependent == self ].
	dependencies add: aDependency
]

{ #category : #accessing }
TypNode >> addDependent: aDependency [

	self assert: [ aDependency dependency == self ].
	dependents add: aDependency.
	^ aDependency dependent
		  addDependency: aDependency;
		  yourself
]

{ #category : #accessing }
TypNode >> addDependent: aNode label: aString [

	^ self addDependent: aNode label: aString data: nil
]

{ #category : #accessing }
TypNode >> addDependent: aNode label: aString data: anObject [

	^ self addDependent: (TypEdge
			   dependency: self
			   dependent: aNode
			   label: aString
			   data: anObject)
]

{ #category : #accessing }
TypNode >> includesDependency: aDependency [

	^ dependencies includes: aDependency
]

{ #category : #accessing }
TypNode >> includesDependent: aDependency [

	^ dependents includes: aDependency
]

{ #category : #accessing }
TypNode >> initialize [

	super initialize.
	dependencies := IdentitySet new.
	dependents := IdentitySet new
]

{ #category : #accessing }
TypNode >> postCopy [

	super postCopy.
	dependencies := IdentitySet new.
	dependents := IdentitySet new
]
